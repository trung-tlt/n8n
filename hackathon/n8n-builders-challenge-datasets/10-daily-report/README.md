# 10 · Owner's End-of-Day Report / Báo cáo cuối ngày cho chủ doanh nghiệp

Fictional café / Quán cà phê giả lập: **Gió Chiều Coffee (demo)**. Report date / Ngày báo cáo: **2026-09-19**. Data covers 13–19 Sep 2026.

## Files
| File | Rows | Purpose |
|---|---|---|
| `sales_orders_7days.csv` | ~281 | Orders. Count only `status = completed` in revenue |
| `daily_targets.csv` | 7 | Revenue and order targets per day |
| `receivables.csv` | 25 | Copy of topic 03 (for Hard) |
| `inventory.csv` | 25 | Copy of topic 05 (for Hard) |

**Core metrics:**
- Revenue = sum of `net_vnd` (completed orders)
- Orders = count of completed orders
- AOV (average order value) = revenue ÷ orders
- Compare with yesterday and with the target; also break down by channel and by hour.

**Hard, top 3 priorities:** e.g. overdue receivables total, items running out before their lead time, and the channel or hour that dropped the most. Each one must cite a number.

## Edge cases / Tình huống đặc biệt
- **2026-09-16** has no orders (store closed), so avoid dividing by zero / ngày không có đơn.
- One order has a **negative** `net_vnd` (a data error) → exclude it and flag / đơn có số tiền âm.
- **Cancelled and refunded** orders must not count as revenue / đơn hủy, hoàn tiền không tính doanh thu.
- 19/9 is a Saturday with a higher target / thứ Bảy có mục tiêu cao hơn.
