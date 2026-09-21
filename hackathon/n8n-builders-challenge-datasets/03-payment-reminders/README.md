# 03 · Payment Reminder Autopilot / Nhắc thanh toán, giảm quên công nợ

Fictional distributor / Nhà phân phối giả lập. **Reference date / Ngày tham chiếu: 2026-09-19**. Use it as "today" in your calculations.

## Files
| File | Rows | Purpose |
|---|---|---|
| `receivables.csv` | 25 | Invoices: `status` = unpaid / paid / disputed |
| `customers.csv` | 12 | Contact per customer |
| `bank_transactions.csv` | 20 | Sample bank statement for reconciliation (Hard) |

Suggested groups: **due soon** (due in 0–7 days), **overdue** (due date < today), **paid**.

## Edge cases / Tình huống đặc biệt
- **INV-2026-804:** paid in the bank but still `unpaid` in the sheet → mark matched and stop reminders.
- **INV-2026-803:** partial payment (50%) / thanh toán một phần.
- **INV-2026-805:** paid with no invoice reference → send to accounting / không ghi mã hóa đơn.
- **INV-2026-807:** reference typo `INV-2026-870` / ghi sai mã.
- **INV-2026-818:** overpaid by 500,000 VND / trả dư.
- **INV-2026-823:** one transfer mentions two invoices / một giao dịch cho hai hóa đơn.
- **TXN0009:** unknown sender / không rõ người chuyển.
- **INV-2026-821:** `disputed` → never auto-remind / đang tranh chấp.
- **INV-2026-802:** already reminded yesterday → don't spam / đã nhắc hôm qua.
