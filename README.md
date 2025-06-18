# Headless Chromium with Playwright in Python (Dockerized)

This is a minimal Proof of Concept using **Playwright** with **Python 3.12** to run **Chromium in headless mode** inside a Docker container. It demonstrates how to automate browser actions and generate a screenshot using Playwright.

## 🧩 Features

- Headless Chromium automation
- Screenshot capture of any webpage
- Fully Dockerized with Python 3.12
- Playwright setup with required browser dependencies

## 📁 Project Structure

```
fastpoc-chromium-playwright/
├── app/
│ └── main.py # Main script to launch browser and take screenshot
├── Dockerfile # Dockerfile with all required dependencies
└── requirements.txt # Python dependencies
```

## 🚀 Getting Started

### 1. Clone this repo
```bash
git clone https://github.com/devruji/fastpoc-chromium-playwright.git
cd fastpoc-chromium-playwright
```

### 2. Build Docker image
```bash
docker build -t playwright-poc .
```

### 3. Run container
```bash
docker run --rm -v "$(pwd)/app:/app" playwright-poc
```

### 4. Output
After running, a screenshot of `https://example.com` will be saved to:
```text
app/screenshot.png
```

## 📌 Notes
- Playwright handles installing Chromium internally, no manual setup needed.
- This example uses async version of Playwright (playwright.async_api).
- The container installs necessary system dependencies for Chromium to run in headless mode.

## 🛠️ Technologies Used
- Python 3.12
- Playwright (Python)
- Chromium (Headless)
- Docker

## 📄 License
This project is open source and available under the [MIT License](https://opensource.org/license/mit).

## 🤝 Contributing
Feel free to fork and open pull requests to expand the functionality (e.g., login automation, PDF generation, scraping, etc.).

Let me know if you want to add badges, GitHub Actions CI, or extend the README with custom usage examples.
