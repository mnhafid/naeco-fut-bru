# Task Overview API

This collection contains APIs for retrieving task overview dashboards, including platform testing progress and defect summaries.

**Base URL:** `{{base-url}}` (e.g., `http://192.168.191.189:8001`)

---

## 1. Inspection Platform and Defects Overview

Retrieve the platform and defects overview for an **Inspection** task.

### Endpoint

```
GET /api/v1/overview/inspections/:id
```

### Path Parameters

| Parameter | Type   | Description           |
|-----------|--------|-----------------------|
| `id`      | UUID   | The inspection task ID |

### cURL Example

```bash
curl -X GET "http://192.168.191.189:8001/api/v1/overview/inspections/11111111-1111-1111-1111-111111111111" \
  -H "Authorization: Bearer <accessToken>"
```

### Response Example

> **Note:** No example response is currently documented for this endpoint. The response structure is expected to be similar to the FUT Platform Dashboard below.

---

## 2. FUT Platform and Defects Overview

Retrieve the platform dashboard for a **FUT** task, including screening progress, tested OK status, and defect counts per platform.

### Endpoint

```
GET /api/v1/overviews/futs/tasks/:id/platforms/dashboard
```

### Path Parameters

| Parameter | Type   | Description      |
|-----------|--------|------------------|
| `id`      | UUID   | The FUT task ID  |

### cURL Example

```bash
curl -X GET "http://192.168.191.189:8001/api/v1/overviews/futs/tasks/58536734-79de-40d5-96e1-5a865c7054c9/platforms/dashboard" \
  -H "Authorization: Bearer <accessToken>"
```

### Response Example

**Status:** `200 OK`

```json
{
  "status": {
    "code": 200,
    "message": "success"
  },
  "data": {
    "platforms": [
      {
        "platform_id": 1,
        "platform_name": "Safari Mobile",
        "screening": {
          "percentage": 0,
          "tc_execute": 0,
          "total_tc": 277
        },
        "tested_ok": {
          "percentage": 100,
          "tc_execute": 277,
          "total_tc": 277
        },
        "defects": {
          "critical": 3,
          "high": 2,
          "medium": 2,
          "minor": 1,
          "open": 8
        }
      },
      {
        "platform_id": 2,
        "platform_name": "Chrome Mobile",
        "screening": {
          "percentage": 0,
          "tc_execute": 0,
          "total_tc": 277
        },
        "tested_ok": {
          "percentage": 100,
          "tc_execute": 277,
          "total_tc": 277
        },
        "defects": {
          "critical": 3,
          "high": 2,
          "medium": 2,
          "minor": 1,
          "open": 8
        }
      }
    ]
  },
  "message": "Successfully retrieved platform dashboard"
}
```
