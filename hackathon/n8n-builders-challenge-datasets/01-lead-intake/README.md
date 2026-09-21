# 01 · AI Lead Intake Assistant / Trợ lý tiếp nhận khách hàng tiềm năng

Fictional business: **Bình Minh Demo Co.**, interior design + corporate training + marketing services.
Doanh nghiệp giả lập: **Công ty Demo Bình Minh**, thiết kế nội thất, đào tạo doanh nghiệp và dịch vụ marketing.

## Files
| File | Rows | Purpose |
|---|---|---|
| `leads.csv` | 25 | Lead history + new leads. `status` = new / contacted |
| `sales_team.csv` | 5 | Salespeople, specialty and current workload |
| `sample_form_submission.json` | 1 | Body to test your Form/Webhook trigger |

**Specialty values:** `interior_apartment`, `interior_office`, `training`, `marketing_services`.
**Suggested SLA:** first contact within 15 minutes (use a 1–2 minute Wait for the demo). Replace `telegram_chat_id` with your own test chat.

## Edge cases / Tình huống đặc biệt
- **L018** has the same phone as **L001** but a different name → duplicate / khách trùng.
- **L022** has the same email as **L003** → duplicate / khách trùng.
- **L013** has no phone number → ask for it or flag / thiếu số điện thoại.
- **L016** is spam; **L011** has no real need → low priority / spam, không có nhu cầu.
- **L006** is written in English → reply in English / trả lời bằng tiếng Anh.
- **L025** is empty with an invalid email → reject / dữ liệu rỗng.
- **S04** is at max capacity (10/10) → do not assign / đã đủ tải.
