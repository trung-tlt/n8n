# 08 · Store Content Assistant / Trợ lý nội dung cho cửa hàng

Fictional café brand / Thương hiệu giả lập: **Gió Chiều Coffee (demo)**. Reference date / Ngày tham chiếu: **2026-09-19**.

## Files
| File | Rows | Purpose |
|---|---|---|
| `products.csv` | 8 | Products, prices and promotions |
| `brand_voice.md` | – | Paste into your prompt |
| `channels.csv` | 3 | Length, format and CTA rules per channel |
| `content_queue.csv` | 3 | Publishing queue. Only `approved` rows may be scheduled |

**promo_type:** `percent` (value = %), `fixed` (value = VND off), `bogo` (buy 1 get 1), `free_shipping`, `gift`, empty = no promotion.

**Fact check (Code node):** every price or percentage in the AI text must match `price_vnd`, `promo_value` or the computed sale price.
P01 sale price = 45,000 × 0.8 = **36,000 VND**.

## Edge cases / Tình huống đặc biệt
- **P02 and P07** have no promotion → the AI must not invent one / không có khuyến mãi, AI không được bịa.
- **P04's** promotion ended on 2026-09-15 → don't mention it / khuyến mãi đã hết hạn.
- **P06's** promotion hasn't started yet (from 22/9) → say "sắp diễn ra" (coming soon) / khuyến mãi chưa bắt đầu.
- **P03** is a one-day buy-1-get-1 offer; **P05** has free delivery only in Q1 and Q3 / mua 1 tặng 1 trong một ngày; miễn phí giao chỉ Q1, Q3.
- **P08** has price 0 (a membership) / thẻ thành viên.
- **POST-03** is still a draft → must not be scheduled without approval / bản nháp chưa được duyệt.
