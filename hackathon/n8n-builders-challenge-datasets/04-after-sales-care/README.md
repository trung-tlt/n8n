# 04 · After-sales Care Desk / Chăm sóc khách hàng sau bán

Fictional home-appliance shop / Cửa hàng gia dụng giả lập: **Nhà Tiện Ích Demo**.

## Files
| File | Rows | Purpose |
|---|---|---|
| `feedback.json` | 20 | Incoming customer feedback (POST one at a time) |
| `orders.csv` | 20 | Order lookup: delivery date, product |
| `support_team.csv` | 5 | Team owners + SLA hours |
| `return_policy.md` | – | Paste into your AI Agent's system message |

Categories to use: `delivery`, `return`, `warranty`, `billing`, `question`, `praise`.
Urgency: `high` (safety, double charge, angry customer, overdue follow-up), `medium`, `low`.

## Edge cases / Tình huống đặc biệt
- **FB-003:** refund request outside the 7-day window, angry customer / quá hạn 7 ngày, khách bức xúc.
- **FB-007:** burning smell → safety escalation / mùi khét, chuyển quản lý ngay.
- **FB-009:** no order ID / không có mã đơn. **FB-015:** order ID not found / mã đơn không tồn tại.
- **FB-012:** double charge → finance / trừ tiền 2 lần.
- **FB-014:** user damage (excluded) / lỗi do người dùng.
- **FB-016:** English message / tin nhắn tiếng Anh. **FB-017:** too vague / quá mơ hồ.
- **FB-005** and **FB-010** aren't complaints / không phải khiếu nại.
