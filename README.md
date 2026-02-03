# VIP Account Automation Engine
**Domain:** Salesforce Development (Apex)

## 📌 Project Overview
This project automates the identification of high-value accounts within Salesforce. When an Account is created or updated with an Annual Revenue exceeding $1,000,000, the system automatically flags it as a "Priority Account" in the description.

## 🛠 Technical Highlights
* **Trigger Handler Pattern:** Uses a logic-less trigger to ensure clean, maintainable, and scalable code.
* **Bulkified Logic:** Designed to handle Salesforce's 200-record batch limit without hitting Governor Limits.
* **Change Tracking:** Utilizes `Trigger.oldMap` to ensure the automation only fires when the Revenue field actually changes, saving system resources.
* **Unit Testing:** Includes a comprehensive test class with 100% code coverage, testing both single-record inserts and bulk updates.

## 🚀 Installation
This code is available as an unmanaged package or can be deployed via SFDX.
1. Deploy `AccountTriggerHandler.cls`
2. Deploy `AccountTrigger.trigger`
3. Run `AccountTriggerHandlerTest.cls` to verify.
