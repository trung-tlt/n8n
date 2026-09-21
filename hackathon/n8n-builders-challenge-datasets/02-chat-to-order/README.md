# 02 · Chat Message to Order / Từ tin nhắn đến đơn hàng

Fictional fashion shop / Shop thời trang giả lập: **Mây Studio (demo)**.

## Files
| File | Rows | Purpose |
|---|---|---|
| `price_list.csv` | 25 | Products, `aliases` for matching (`;`-separated), sizes, price, stock, `substitute_sku` |
| `shipping_fees.csv` | 3 | Shipping fee by zone |
| `chat_messages.json` | 12 | Incoming chat messages. POST one at a time to your Webhook |

`_scenario` in each message tells you what it tests. Remove it before sending to the AI if you want a blind test.
`_scenario` mô tả tình huống kiểm thử. Có thể xóa trường này để kiểm tra "mù".

## Edge cases / Tình huống đặc biệt
- **MSG-003:** out of stock (TS-BLK → TS-NVY) and missing phone/address.
- **MSG-004:** out of stock (DR-FLR → DR-WRP).
- **MSG-005:** no diacritics / không dấu, teencode.
- **MSG-006:** missing size, quantity, phone and address → ask back / hỏi lại.
- **MSG-007:** quantity greater than stock / vượt tồn kho.
- **MSG-008:** unknown product / sản phẩm không có.
- **MSG-009:** a cancel request, not an order / yêu cầu hủy đơn.
- **MSG-010:** delivery outside HCMC / giao tỉnh.
- **MSG-012:** size 33 doesn't exist / size không có.
