# 06 · Booking & Reminder Assistant / Trợ lý đặt lịch và nhắc hẹn

Fictional salon & spa / Salon & spa giả lập: **Lá Spa & Hair (demo)**. Bookings are for **26–27 Sep 2026**.

## Files
| File | Rows | Purpose |
|---|---|---|
| `booking_requests.json` | 12 | Incoming book / reschedule / cancel requests |
| `bookings.csv` | 20 | Existing calendar. `status` = confirmed / pending / cancelled |
| `services.csv` | 6 | Duration, price, required skill |
| `staff.csv` | 4 | Skills, working days and hours |
| `business_hours.csv` | 7 | Opening hours |
| `waitlist.csv` | 4 | Customers waiting for a slot (Hard) |

**Clash rule:** `new.start < existing.end AND new.end > existing.start`, for the same staff member, ignoring `cancelled` bookings.
Send the reminder e.g. 24 hours before (use 1 minute in the demo). A Google Calendar version is optional.

## Edge cases / Tình huống đặc biệt
- **REQ-003 + REQ-004:** the same slot 20 seconds apart → confirm only one / hai khách đặt cùng khung giờ.
- **REQ-002:** clash → suggest an alternative / trùng lịch, đề xuất giờ khác.
- **REQ-005:** no spa staff on Sunday / không có nhân viên. **REQ-006:** ends after closing time / quá giờ đóng cửa.
- **REQ-007:** reschedule. **REQ-008:** cancel → invite **WL01** or **WL02** (first to accept wins) / mời danh sách chờ.
- **REQ-009:** unknown service. **REQ-010:** date in the past. **REQ-012:** booking not found.
- **REQ-011:** free-text request (AI optional); it asks for spa on Sunday, when no spa staff work / yêu cầu viết tự do, Chủ nhật không có nhân viên spa.
- **BK017** is already cancelled, so its slot is free / lịch đã hủy, khung giờ trống.
