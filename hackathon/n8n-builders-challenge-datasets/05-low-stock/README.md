# 05 · Low-stock Early Warning / Cảnh báo hàng sắp hết

Fictional café / Quán cà phê giả lập: **Gió Chiều Coffee (demo)**. Reference date / Ngày tham chiếu: **2026-09-19**.

## Files
| File | Rows | Purpose |
|---|---|---|
| `inventory.csv` | 25 | Stock, minimum level, average daily sales, supplier lead time |
| `sales_last_14_days.csv` | ~330 | Daily sales per SKU. Use it to recompute the average for Medium |
| `suppliers.csv` | 5 | Supplier contact + minimum order value |

**Formulas:**
- `days_left = current_stock / avg_daily_sales`
- `reorder if days_left <= lead_time_days + 1`
- `suggested_qty = avg_daily_sales × (lead_time_days + 7) − current_stock` (round up)

## Edge cases / Tình huống đặc biệt
- **SY-VNL:** stock is 0, already out / đã hết hàng.
- **CF-DEC:** new item, `avg_daily_sales` is empty and there are only 2 days of history / hàng mới, thiếu dữ liệu.
- **IC-CUB:** no `lead_time_days` and no supplier / thiếu thời gian nhập, không có NCC.
- **NP-TIS:** negative stock (−4), a data error to flag / tồn kho âm.
- **CP-16O**, **ST-PPR** and **MK-FRS** are below minimum; **CF-ARA** runs out before its lead time / sắp hết trước khi kịp nhập.
- **SUP03** orders may fall below `min_order_vnd` / đơn gộp chưa đạt giá trị tối thiểu.
