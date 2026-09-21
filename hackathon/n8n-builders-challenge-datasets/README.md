# n8n Builders Challenge · Sample Datasets / Bộ dữ liệu mẫu

**Ho Chi Minh City · 19 Sep 2026.** One folder per topic in the Topic Brief. Mỗi đề tài một thư mục.

> ⚠️ **All data is fictional.** Every person, phone number, email, company and invoice is made up for testing.
> Emails use `example.com` and phone numbers are random. Replace `telegram_chat_id` / email recipients with **your own test channels**.
> **Toàn bộ dữ liệu là giả lập.** Hãy gửi kết quả đến email hoặc kênh chat thử nghiệm của đội.

**Reference date / Ngày tham chiếu: `2026-09-19`.** Treat it as "today" when calculating due dates, warranty and stock.

## Folders
| # | Folder | Main files |
|---|---|---|
| 01 | `01-lead-intake` | leads.csv, sales_team.csv |
| 02 | `02-chat-to-order` | chat_messages.json, price_list.csv, shipping_fees.csv |
| 03 | `03-payment-reminders` | receivables.csv, bank_transactions.csv, customers.csv |
| 04 | `04-after-sales-care` | feedback.json, orders.csv, return_policy.md |
| 05 | `05-low-stock` | inventory.csv, sales_last_14_days.csv, suppliers.csv |
| 06 | `06-booking-reminders` | booking_requests.json, bookings.csv, staff.csv, waitlist.csv |
| 07 | `07-invoice-approval` | payment_requests.csv, invoices/ (PDF + JPG), approval_rules.csv |
| 08 | `08-store-content` | products.csv, brand_voice.md, channels.csv |
| 09 | `09-warranty-dispatch` | warranty_requests.json, purchases.csv, technicians.csv |
| 10 | `10-daily-report` | sales_orders_7days.csv, daily_targets.csv (+ copies from 03 & 05) |

Each folder has a `README.md` that lists its columns and **edge cases to demo**. Fields starting with `_` (e.g. `_scenario`) are hints for builders, so remove them for a blind test.

## How to use / Cách dùng
1. **Google Sheets:** File → Import → Upload the CSV → *Insert new sheet*. Then connect with the **Google Sheets** node.
2. **n8n Data Tables:** create a table and import the CSV, or read the file with **Read/Write Files from Disk** + **Extract from File**.
3. **JSON requests:** paste a single object into a **Webhook** test call (e.g. `curl -X POST <test-url> -H "Content-Type: application/json" -d @one.json`), or use a **Code** node that returns the array and **Loop Over Items**.
4. **Invoices (topic 07):** upload through an **n8n Form** file field, then use **Extract from File** (PDF) or a vision-capable model (JPG).
5. **Excel users:** open CSVs via *Data → From Text/CSV* and choose **UTF-8**, so Vietnamese characters display correctly.

CSV conventions: UTF-8, comma-separated, dates in ISO format (`YYYY-MM-DD`), amounts in VND as whole numbers, lists separated by `;`.
