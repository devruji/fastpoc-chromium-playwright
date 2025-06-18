import asyncio
from playwright.async_api import async_playwright


async def run():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        context = await browser.new_context()
        page = await context.new_page()
        await page.goto("https://example.com")
        await page.screenshot(path="/app/screenshot.png")
        print("Screenshot taken and saved to /app/screenshot.png")

        # add scraping logic here
        # For example, extract the title of the page
        title = await page.title()
        print(f"Page title: {title}")
        # You can also extract other elements, like the first heading
        heading = await page.query_selector("h1")
        if heading:
            heading_text = await heading.inner_text()
            print(f"First heading: {heading_text}")
        else:
            print("No heading found on the page.")
        # Optionally, you can wait for a specific element to appear
        # await page.wait_for_selector("h1")
        # Optionally, you can close the page if you are done with it
        await page.close()

        # Close the browser & context
        await context.close()
        await browser.close()


if __name__ == "__main__":
    asyncio.run(run())
