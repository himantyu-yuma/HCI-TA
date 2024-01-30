from playwright.sync_api import Playwright, sync_playwright, expect


def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto("http://localhost:2000/")
    page.get_by_role("textbox").click()
    page.get_by_role("textbox").fill("hoge")
    page.get_by_role("textbox").press("Enter")
    expect(page.get_by_role("paragraph")).to_contain_text("Success!")

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)
