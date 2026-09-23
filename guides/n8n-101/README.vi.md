# n8n 101 — Hướng dẫn tự động hoá quy trình cho người mới bắt đầu (PDF miễn phí, Tiếng Việt + English)

**Tài liệu 20 trang miễn phí dành cho người mới bắt đầu với n8n** — nền tảng tự động hoá
quy trình (workflow automation) mã nguồn mở theo mô hình fair-code. Hiểu **n8n là gì**,
**các khái niệm cốt lõi**, **tính năng chính**, **hệ sinh thái hơn 400 tích hợp**,
**AI Agent & RAG**, cùng **các ví dụ ứng dụng thực tế** — tất cả trong một tài liệu ngắn gọn.

Có sẵn bản **Tiếng Việt** và **English**.

> Phiên bản 1.0 · Tháng 9, 2026 · Dựa trên thông tin công khai từ [n8n.io](https://n8n.io)
> Tài liệu cộng đồng do **Trung Tran** biên soạn — n8n Ambassador & verified creator.
> Đây *không phải* ấn phẩm chính thức của n8n GmbH.

📄 English version: [README.md](./README.md)

---

## 📥 Tải tài liệu

| Ngôn ngữ | Tệp | Dung lượng |
|---|---|---|
| 🇻🇳 Tiếng Việt | [**n8n-101-beginners-guide-vi.pdf**](./n8n-101-beginners-guide-vi.pdf) | ~1.2 MB |
| 🇬🇧 English | [**n8n-101-beginners-guide-en.pdf**](./n8n-101-beginners-guide-en.pdf) | ~1.0 MB |

Không cần đăng ký, không cần để lại email.

---

## 👥 Tài liệu này dành cho ai?

- **Người mới hoàn toàn**, chưa từng xây dựng một quy trình tự động nào
- Người dùng **no-code / không chuyên kỹ thuật** trong marketing, sales, chăm sóc khách hàng, vận hành và nhân sự
- **Lập trình viên và đội IT** đang cân nhắc n8n so với Zapier, Make (Integromat) hay Power Automate
- Bất kỳ ai đang phân vân giữa **n8n Cloud và self-host**

Không cần biết lập trình.

---

## 📖 Mục lục đầy đủ

### Chương 1 · n8n là gì?
Giới thiệu nền tảng, các con số nổi bật và lý do nên tự động hoá.
n8n (đọc là *"n-eight-n"*, viết tắt của **nodemation**) là nền tảng tự động hoá quy trình
mã nguồn mở: **hơn 400 tích hợp có sẵn**, **hơn 200.000 đội nhóm** trên toàn thế giới,
mô hình **fair-code** và **self-host** được.

### Chương 2 · Khái niệm cốt lõi — 7 khái niệm cần nhớ
**Workflow** · **Node** · **Trigger** · **Execution** · **Credential** · **Action** ·
**Logic & Control** (IF, Filter, Switch, Merge). Kèm cách dữ liệu chảy qua workflow dưới
dạng **items** (bản ghi JSON).

### Cách đọc một workflow
Ví dụ trực quan từng node: tự động xử lý email hỗ trợ khách hàng —
Gmail trigger → node AI phân loại → IF (khẩn cấp?) → Slack hoặc Google Sheets.

### Chương 3 · Tính năng chính
**Trình soạn kéo–thả trực quan**, **viết code khi cần** (JavaScript & Python),
hàng nghìn **template** có sẵn, **tự host hoặc dùng Cloud**, **xử lý lỗi & chạy lại (retry)**,
và bước phê duyệt **human-in-the-loop**.

### AI trong n8n
**AI Agent** (tự chọn công cụ), **RAG** với vector store để AI trả lời dựa trên tài liệu nội bộ
của bạn, **Chat Trigger** để nhúng giao diện chat, và lựa chọn model linh hoạt
(OpenAI, Anthropic, Google Gemini, Ollama, model tự host). Xây dựng trên LangChain.

### Chương 4 · Hệ sinh thái tích hợp
Hơn 400 tích hợp có sẵn: giao tiếp (Slack, Gmail, Telegram, Discord, Microsoft Teams,
WhatsApp), dữ liệu & tài liệu (Google Sheets, Notion, Airtable, PostgreSQL, MySQL,
Google Drive), AI (OpenAI, Anthropic, Gemini, Ollama, Pinecone, Hugging Face),
sales & marketing (HubSpot, Salesforce, Shopify, Stripe, Mailchimp) và phát triển phần mềm
(GitHub, GitLab, Jira, AWS, Docker) — cùng **HTTP Request** và **Webhook** cho mọi API khác.

### Chương 5 · Ứng dụng thực tế
Ý tưởng tự động hoá theo phòng ban (Marketing, Sales & Support, Vận hành & Nhân sự,
IT & Dữ liệu), cùng 3 case study doanh nghiệp:

| Doanh nghiệp | Kết quả |
|---|---|
| **Delivery Hero** | Tiết kiệm ~200 giờ mỗi tháng chỉ từ một workflow khôi phục tài khoản |
| **StepStone** | Tích hợp nguồn dữ liệu mới nhanh gấp 25 lần — từ 2 tuần xuống còn ~2 giờ |
| **Vodafone** | Tiết kiệm ~2,2 triệu bảng Anh chi phí vận hành nhờ tự động hoá luồng threat intelligence |

### Chương 6 · Bắt tay vào làm
Tạo **workflow đầu tiên trong 5 bước**, chọn cách triển khai (**n8n Cloud hay self-host**),
và danh sách **nên / tránh** để workflow ổn định, dễ bảo trì.

### Chương 7 · Thực hành
- **Hiểu dữ liệu trong n8n** — item, field và JSON
- **Expression** — dùng dữ liệu từ bước trước, ví dụ `{{ $json.email }}`
- **Bài thực hành #1** — tạo workflow đầu tiên trong 10 phút (Schedule Trigger → Send Email),
  không cần AI, không cần API key
- **IF & rẽ nhánh** — điều kiện, nhánh True/False
- **Debug** — checklist 5 bước, kiểm tra từ trái sang phải

### Chương 8 · Học tiếp
Tài nguyên chính thức ([docs.n8n.io](https://docs.n8n.io),
[n8n.io/workflows](https://n8n.io/workflows),
[community.n8n.io](https://community.n8n.io),
[youtube.com/@n8n-io](https://www.youtube.com/@n8n-io)) và sổ tay thuật ngữ nhanh
(canvas, webhook, expression, item, fair-code, sub-workflow).

---

## ⚡ Tóm tắt trong 30 giây

- **n8n** là công cụ tự động hoá quy trình trực quan: nối các app bằng cách kéo–thả node trên canvas.
- **Trigger** khởi động workflow; các node **action** thực hiện công việc; mỗi lần chạy là một **execution**.
- Dữ liệu chảy giữa các node dưới dạng **item** (JSON), truy xuất bằng **expression** như `{{ $json.name }}`.
- Khác với đa số công cụ no-code, bạn có thể chèn **JavaScript hoặc Python** ở bất kỳ bước nào — và
  **self-host** để dữ liệu nằm trong hạ tầng của bạn.
- Hãy bắt đầu nhỏ: tự động hoá một việc lặp lại, có quy tắc rõ ràng và tốn nhiều thời gian nhất.

---

## 🧭 Nội dung khác trong repository này

- [`../../workflows/`](../../workflows) — các file JSON workflow n8n, import là dùng được
- [`../../hackathon/`](../../hackathon) — dataset n8n Builders Challenge và hướng dẫn self-host
- [`../`](../) — tất cả tài liệu hướng dẫn trong repository

---

## ❓ Câu hỏi thường gặp

**n8n có miễn phí không?**
Bản Community miễn phí, mã nguồn mở theo giấy phép fair-code, và bạn có thể self-host chỉ
với một lệnh Docker. n8n Cloud là dịch vụ trả phí (có bản dùng thử), tính giá theo số lần
workflow chạy.

**Nên dùng Cloud hay self-host?**
Cloud nhanh nhất để bắt đầu, không cần kiến thức máy chủ. Self-host cho bạn toàn quyền
kiểm soát dữ liệu, không giới hạn workflow/execution, nhưng bạn tự lo cài đặt, cập nhật,
sao lưu và bảo mật. Tài liệu có bảng so sánh chi tiết — và workflow xuất/nhập dễ dàng
dưới dạng JSON nên bắt đầu ở Cloud không gây khoá chặt.

**Có cần biết lập trình không?**
Không. Tài liệu viết cho người mới hoàn toàn; code là tuỳ chọn, không bắt buộc.

**n8n khác gì Zapier hay Make?**
Mã nguồn mở và self-host được, không tính phí theo số tác vụ khi tự host, và có thể viết
JavaScript/Python thật bên trong bất kỳ bước nào.

**Tôi có được chia sẻ tài liệu này không?**
Có — đây là tài liệu cộng đồng miễn phí cho mục đích học tập. Vui lòng giữ nguyên phần ghi
nhận tác giả.

---

## 🏷️ Từ khoá

`n8n` · `hướng dẫn n8n` · `n8n tiếng việt` · `n8n cho người mới` · `n8n 101` ·
`tự động hoá quy trình` · `workflow automation` · `no-code` · `low-code` · `ai agent` ·
`rag` · `langchain` · `self-host n8n` · `n8n cloud` · `thay thế zapier` · `ebook` · `pdf`

---

## 📄 Ghi nhận & giấy phép

Tài liệu cộng đồng do **Trung Tran** (n8n Ambassador & verified creator) biên soạn cho mục
đích học tập, dựa trên thông tin công khai từ n8n.io.
**Không phải ấn phẩm chính thức của n8n GmbH.** "n8n" và các tên sản phẩm khác thuộc về
chủ sở hữu tương ứng.

Được tự do đọc, tải về và chia sẻ cho mục đích giáo dục, phi thương mại — kèm ghi nhận tác giả.
