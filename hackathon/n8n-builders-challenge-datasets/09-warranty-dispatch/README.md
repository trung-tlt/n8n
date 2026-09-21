# 09 · Warranty Intake & Dispatch / Tiếp nhận và điều phối bảo hành

Fictional electronics chain / Chuỗi điện máy giả lập: **Điện Máy Demo**. Reference date / Ngày tham chiếu: **2026-09-19**.

## Files
| File | Rows | Purpose |
|---|---|---|
| `warranty_requests.json` | 12 | Incoming requests |
| `purchases.csv` | 25 | Serial number → product, purchase date, warranty months, district |
| `technicians.csv` | 5 | Skills (by `category`), service areas, workload |
| `open_tickets.csv` | 6 | Existing tickets, for overdue reminders (Hard) |
| `warranty_policy.md` | – | Rules for the AI / Code |

Warranty end date = `purchase_date + warranty_months` (Date & Time node).
Tracking code format suggestion: `WT-YYMMDD-###`.

## Edge cases / Tình huống đặc biệt
- **WR-002:** warranty expired → paid repair / hết bảo hành.
- **WR-003:** district Củ Chi has no technician / không có kỹ thuật viên phụ trách.
- **WR-004:** expires tomorrow, so still valid / còn bảo hành 1 ngày.
- **WR-005:** dropped TV → excluded; **WR-010:** liquid → `needs_inspection` / lỗi do người dùng.
- **WR-006:** serial number not found / không tìm thấy serial.
- **WR-009:** too vague → ask for details / mô tả mơ hồ.
- **WR-012:** status inquiry for **WT-900**, not a new ticket / hỏi tiến độ.
- **T02** is fully booked (5/5) / đã đủ việc.
- **WT-900** is due today and the customer hasn't had an update for 3 days.
- **Overdue:** WT-902 and WT-903 are past `due_date`, and customers haven't been updated for more than 2 days / quá hạn, chưa cập nhật cho khách.
