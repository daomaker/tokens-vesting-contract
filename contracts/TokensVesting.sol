// SPDX-License-Identifier: Unlicensed
pragma solidity 0.7.3;

import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";


/**
 * @title TokensVesting
 * @dev A token holder contract that can release its token balance gradually like a
 * typical vesting scheme, with a cliff and vesting period.
 */
contract TokensVesting {
  using SafeMath for uint256;
  using SafeERC20 for IERC20;

  // Durations and timestamps are expressed in UNIX time
  uint256 public start;
  uint256 public finish;
  uint256 public cliff;
  uint256 public releasePeriod;
  uint256 public releaseCount;
  uint256 public released;

  // Beneficiary of tokens after they are released
  address payable public beneficiary;

  // Token interface
  IERC20 public token;

  event TokensReleased(uint256 amount);


	// -----------------------------------------------------------------------
	// CONSTRUCTOR
	// -----------------------------------------------------------------------


  /**
   * @dev Creates a vesting contract that vests its balance of any ERC20 token to the
   * beneficiary, gradually in a linear fashion until start + duration. By then all
   * of the balance will have vested.
   * @param _token address of the token which should be vested
   * @param _beneficiary address to whom vested tokens are transferred
   * @param _start the time (as Unix time) at which point vesting starts
   * @param _cliff (in seconds) until which vesting should be paused
   * @param _releasePeriod (in seconds) it should represent the periods (ex: release should be once per 1 month, 3 month and etc)
   * @param _releaseCount the count of periods, during which beneficiary can release tokens (ex: "12" if 1 year and only once per month)
   */
  constructor (
    address _token,
    address payable _beneficiary,
    uint256 _start,
    uint256 _cliff,
    uint256 _releasePeriod,
    uint256 _releaseCount
  ) public {
    require(_beneficiary != address(0), "Vesting: beneficiary is the zero address");
    require(_start > block.timestamp, "Vesting: vesting should be start in future");
    require(_releaseCount != 0, "Vesting: the vesting contract should have minimum one release");
    require(_releasePeriod != 0, "Vesting: release duration should be bigger than 0");

    start = _start;
    cliff = _cliff;
    token = IERC20(_token);
    beneficiary = _beneficiary;
    releaseCount = _releaseCount;
    releasePeriod = _releasePeriod;
    finish = start.add(cliff).add(releaseCount.mul(releasePeriod));
  }

  fallback () external payable {}
  receive () external payable {}


	// -----------------------------------------------------------------------
	// SETTERS
	// -----------------------------------------------------------------------


  /**
   * @notice Transfers vested tokens to beneficiary.
   */
  function release() external {
    uint256 unreleased = _releasableAmount();
    require(unreleased > 0, "release: No tokens are due!");
    require(msg.sender == beneficiary, "release: Only beneficiary can release tokens!");

    released = released.add(unreleased);
    token.safeTransfer(beneficiary, unreleased);

    emit TokensReleased(unreleased);
  }


	// -----------------------------------------------------------------------
	// GETTERS
	// -----------------------------------------------------------------------


  function getAvailableTokens() external view returns (uint256) {
    return _releasableAmount();
  }


	// -----------------------------------------------------------------------
	// INTERNAL
	// -----------------------------------------------------------------------


  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   */
  function _releasableAmount() private view returns (uint256) {
    return _vestedAmount().sub(released);
  }

  /**
   * @dev Calculates the amount that has already vested.
   */
  function _vestedAmount() private view returns (uint256) {
    uint256 currentBalance = token.balanceOf(address(this));
    uint256 totalBalance = currentBalance.add(released);

    if (block.timestamp < start.add(cliff)) {
      return 0;
    } else if (block.timestamp >= finish) {
      return totalBalance;
    } else {
      uint256 vestingStartTime = start.add(cliff);
      uint256 timeLeftAfterStart = block.timestamp.sub(vestingStartTime);
      uint256 availableReleases = timeLeftAfterStart.div(releasePeriod);
      uint256 tokensPerRelease = totalBalance.div(releaseCount);

      return availableReleases.mul(tokensPerRelease);
    }
  }
}