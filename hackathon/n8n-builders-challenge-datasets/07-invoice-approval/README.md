# 07 · Invoice Capture & Expense Approval / Thu thập hóa đơn, duyệt chi phí

Fictional company / Công ty giả lập: **Công ty Demo Bình Minh**. All invoices are watermarked **SAMPLE** and aren't real tax invoices.

## Files
| File | Rows | Purpose |
|---|---|---|
| `payment_requests.csv` | 9 | Requests to feed into your form (or upload files manually) |
| `invoices/` | 8 | 6 PDF + 2 JPG invoices for extraction |
| `employees.csv` | 4 | Employee → department manager |
| `approval_rules.csv` | 5 | Approval limits (VND, including VAT) |
| `recorded_invoices.csv` | 3 | Invoices already in the books, for duplicate checks |
| `_answer_key_invoice_totals.json` | – | Correct totals, to check your AI extraction |

**Duplicate key:** `supplier_tax_code + invoice_number` (or `supplier + number + total` when the tax code is missing).

## Edge cases / Tình huống đặc biệt
- **PR-005 (INV-0087 copy):** duplicate of PR-002, and already recorded / hóa đơn trùng.
- **PR-008:** blurry, tilted photo → flag low confidence / ảnh mờ.
- **PR-007:** amount claimed (450,000) ≠ invoice total / số tiền đề nghị khác hóa đơn.
- **PR-006:** over 50M → director, and the invoice has no tax code / vượt hạn mức, thiếu MST.
- **PR-004:** entertainment → always needs finance (R5) / tiếp khách luôn cần tài chính duyệt.
- **PR-009:** no invoice attached / thiếu chứng từ.
- **PR-007's invoice** is dated 2026-08-02, over 45 days old / hóa đơn cũ.
