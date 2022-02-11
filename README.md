# Tokens vesting contract

### Install

Clone this repository: <br>
`git clone https://github.com/daomaker/tokens-vesting-contract.git`

Install dependencies: <br>
`tokens-vesting-contract && npm install`

### Tests

The project uses [HardHat](https://hardhat.org/), so all additional methods and plugins can bee found on their [documentation](https://hardhat.org/getting-started/).  <br><br>
For UNIT tests run: <br>
`npx hardhat test`


### Deploy

Before running deployment you need to write out setup variables. Run `cp .env.prod .env` and write down all params of `.env` file. Then go to `./scripts/deploy.js` and write down **token**, **beneficiary**, **start**, **cliff**, **release period**, **releases count** variables.<br>
- `token`: Address of token, which beneficiary should receive
- `beneficiary`: Address of beneficiary, who should receive vested tokens
- `start`: Time when vesting start (_should be UNIX timestamp of the certain date_)
- `cliff`: Additional time in seconds which will added to `start`. During the cliff releases is not available (_can be setted as 0 if no cliff_)
- `releasePeriod`: Time in seconds for releases (_e.g. 3 months should be as 7776000_)
- `releaseCount`: Total amount of upcoming releases

All popular networks are supported, for deploy run: <br>
`npx hardhat run scripts/deploy.js --network [NETWORK]`

### Verification on Etherscan

For Etherscan verification after deployment run this commands:<br>

`npx hardhat verify --network [NETWORK_NAME] [FACTORY_CONTRACT] "BENEFICIARY" "START" "CLIFF" "RELEASE_PERIOD" "RELEASE_COUNT"` <br>

### How it works

After deploying the **Vesting contract**, it should receive tokens for future vesting logic. Owner can simply transfer required amount of tokens to the contract address. There are multiply releases with the same delay. When time will be reached release tokens will be available for claiming.

### Methods for UI

1) `vesting.release()`: Beneficiary receives releasable tokens
2) `vesting.getAvailableTokens()`: Get tokens amount, which beneficiary can receive at that moment
3) <?xml version="1.0" encoding="UTF-8"?><rss version="2.0"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
	xmlns:georss="http://www.georss.org/georss" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:media="http://search.yahoo.com/mrss/"
	
	>
<channel>
	<title>
	Comments for Embedded in Open Source	</title>
	<atom:link href="https://eios.wordpress.com/comments/feed/" rel="self" type="application/rss+xml" />
	<link>https://eios.wordpress.com</link>
	<description>Ramblings on Linux and open source software in the embedded world</description>
	<lastBuildDate>Fri, 10 Apr 2020 15:39:28 +0000</lastBuildDate>
	<sy:updatePeriod>
	hourly	</sy:updatePeriod>
	<sy:updateFrequency>
	1	</sy:updateFrequency>
	<generator>http://wordpress.com/</generator>
	<item>
		<title>
		Comment on Hello world! by Darios DaHippe		</title>
		<link>https://eios.wordpress.com/2005/12/13/hello-world/#comment-7</link>

		<dc:creator><![CDATA[Darios DaHippe]]></dc:creator>
		<pubDate>Fri, 10 Apr 2020 15:39:28 +0000</pubDate>
		<guid isPermaLink="false">#comment-7</guid>

					<description><![CDATA[Domain &#038; VPN Drivers 
CCF.E-T 
C : \ &#062;
TextFile:1
C : \ NC
By
Brno.co]]></description>
			<content:encoded><![CDATA[<p>Domain &amp; VPN Drivers<br />
CCF.E-T<br />
C : \ &gt;<br />
TextFile:1<br />
C : \ NC<br />
By<br />
Brno.co</p>
]]></content:encoded>
		
			</item>
		<item>
		<title>
		Comment on Hello world! by DariosDaHipee		</title>
		<link>https://eios.wordpress.com/2005/12/13/hello-world/#comment-6</link>

		<dc:creator><![CDATA[DariosDaHipee]]></dc:creator>
		<pubDate>Wed, 08 Apr 2020 01:24:11 +0000</pubDate>
		<guid isPermaLink="false">#comment-6</guid>

					<description><![CDATA[&#038;Co.Core\✓©%®✓¶π
www.eioscom.wordpress.com]]></description>
			<content:encoded><![CDATA[<p>&amp;Co.Core\✓©%®✓¶π<br />
<a href="http://www.eioscom.wordpress.com" rel="nofollow ugc">http://www.eioscom.wordpress.com</a></p>
]]></content:encoded>
		
			</item>
		<item>
		<title>
		Comment on About by vokos		</title>
		<link>https://eios.wordpress.com/about/#comment-5</link>

		<dc:creator><![CDATA[vokos]]></dc:creator>
		<pubDate>Mon, 06 Apr 2020 09:18:39 +0000</pubDate>
		<guid isPermaLink="false">/about/#comment-5</guid>

					<description><![CDATA[Weather:\PCMarinos]]></description>
			<content:encoded><![CDATA[<p>Weather:\PCMarinos</p>
]]></content:encoded>
		
			</item>
		<item>
		<title>
		Comment on About by vokos		</title>
		<link>https://eios.wordpress.com/about/#comment-4</link>

		<dc:creator><![CDATA[vokos]]></dc:creator>
		<pubDate>Mon, 06 Apr 2020 09:16:44 +0000</pubDate>
		<guid isPermaLink="false">/about/#comment-4</guid>

					<description><![CDATA[https://www.google.com/search?hl=el&#038;ei=IfOKXriKCYPgkgXIjIH4Aw&#038;q=8ηςfebr%27s.organization&#038;oq=&#038;gs_lcp=ChNtb2JpbGUtZ3dzLXdpei1zZXJwEAEYAzICCCkyAggpMgIIKTICCCkyAggpMgIIKTICCCkyAggpUABYAGDjvQFoAHAAeACAAQCIAQCSAQCYAQCgAQGwAQg&#038;sclient=mobile-gws-wiz-serp]]></description>
			<content:encoded><![CDATA[<p><a href="https://www.google.com/search?hl=el&#038;ei=IfOKXriKCYPgkgXIjIH4Aw&#038;q=8ηςfebr%27s.organization&#038;oq=&#038;gs_lcp=ChNtb2JpbGUtZ3dzLXdpei1zZXJwEAEYAzICCCkyAggpMgIIKTICCCkyAggpMgIIKTICCCkyAggpUABYAGDjvQFoAHAAeACAAQCIAQCSAQCYAQCgAQGwAQg&#038;sclient=mobile-gws-wiz-serp" rel="nofollow ugc">https://www.google.com/search?hl=el&#038;ei=IfOKXriKCYPgkgXIjIH4Aw&#038;q=8ηςfebr%27s.organization&#038;oq=&#038;gs_lcp=ChNtb2JpbGUtZ3dzLXdpei1zZXJwEAEYAzICCCkyAggpMgIIKTICCCkyAggpMgIIKTICCCkyAggpUABYAGDjvQFoAHAAeACAAQCIAQCSAQCYAQCgAQGwAQg&#038;sclient=mobile-gws-wiz-serp</a></p>
]]></content:encoded>
		
			</item>
		<item>
		<title>
		Comment on Hello world! by vokos		</title>
		<link>https://eios.wordpress.com/2005/12/13/hello-world/#comment-3</link>

		<dc:creator><![CDATA[vokos]]></dc:creator>
		<pubDate>Sat, 04 Apr 2020 08:33:10 +0000</pubDate>
		<guid isPermaLink="false">#comment-3</guid>

					<description><![CDATA[www.brojelijk.weebly.com]]></description>
			<content:encoded><![CDATA[<p><a href="http://www.brojelijk.weebly.com" rel="nofollow ugc">http://www.brojelijk.weebly.com</a></p>
]]></content:encoded>
		
			</item>
		<item>
		<title>
		Comment on Hello world! by lucretiahowe39213		</title>
		<link>https://eios.wordpress.com/2005/12/13/hello-world/#comment-2</link>

		<dc:creator><![CDATA[lucretiahowe39213]]></dc:creator>
		<pubDate>Fri, 08 Apr 2016 10:34:24 +0000</pubDate>
		<guid isPermaLink="false">#comment-2</guid>

					<description><![CDATA[Sorry about that Pace. When I get a moment I’ll have to update the post. The address is: Come on &lt;a href=&#039;http://tropaadet.dk/lucretiahowe39213081830&#039; rel=&quot;nofollow&quot;&gt;http://tropaadet.dk/lucretiahowe39213081830&lt;/a&gt;]]></description>
			<content:encoded><![CDATA[<p>Sorry about that Pace. When I get a moment I’ll have to update the post. The address is: Come on <a href='http://tropaadet.dk/lucretiahowe39213081830' rel="nofollow">http://tropaadet.dk/lucretiahowe39213081830</a></p>
]]></content:encoded>
		
			</item>
		<item>
		<title>
		Comment on Hello world! by Mr WordPress		</title>
		<link>https://eios.wordpress.com/2005/12/13/hello-world/#comment-1</link>

		<dc:creator><![CDATA[Mr WordPress]]></dc:creator>
		<pubDate>Tue, 13 Dec 2005 22:37:37 +0000</pubDate>
		<guid isPermaLink="false">#comment-1</guid>

					<description><![CDATA[Hi, this is a comment.&lt;br /&gt;To delete a comment, just log in, and view the posts&#039; comments, there you will have the option to edit or delete them.]]></description>
			<content:encoded><![CDATA[<p>Hi, this is a comment.<br />To delete a comment, just log in, and view the posts&#8217; comments, there you will have the option to edit or delete them.</p>
]]></content:encoded>
		
			</item>
	</channel>
</rss>
