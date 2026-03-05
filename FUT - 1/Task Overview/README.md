# Task Overview API

This collection contains APIs for retrieving task overview dashboards, including platform testing progress, defect summaries, and defect penetration rates.

**Base URL:** `{{base-url}}` (e.g., `http://192.168.191.189:8001`)

> **Note:** Some fields in the response may return `null` when no data is available. Clients should treat `null` values as empty arrays (`[]`) where an array is expected (e.g., `platforms`, `defects_penetration`).

---

## 1. Inspection Platform and Defects Overview

Retrieve the platform and defects overview for an **Inspection** task.

### Endpoint

```
GET /api/v1/overviews/inspections/:id
```

### Path Parameters

| Parameter | Type   | Description           |
|-----------|--------|-----------------------|
| `id`      | UUID   | The inspection task ID |

### cURL Example

```bash
curl -X GET "http://192.168.191.189:8001/api/v1/overviews/inspections/tasks/11111111-1111-1111-1111-111111111111" \
  -H "Authorization: Bearer <accessToken>"
```

### Response Example

**Status:** `200 OK`

```json
{
  "process_time": "116ms",
  "status": "success",
  "code": "",
  "message": "Successfully retrieved platform dashboard",
  "data": {
    "defects_penetration": {
      "total_defect": 2,
      "open": 1,
      "penetration_rate": 16.666666666666664,
      "critical": 0,
      "high": 0,
      "medium": 1,
      "minor": 0
    },
    "platforms": [
      {
        "platform_id": 8,
        "platform_name": "Chrome Desktop",
        "screening": {
          "percentage": 0,
          "tc_execute": 0,
          "total_tc": 1
        },
        "tested_ok": {
          "percentage": 100,
          "tc_execute": 1,
          "total_tc": 1
        },
        "defects": {
          "critical": 0,
          "high": 0,
          "medium": 1,
          "minor": 0,
          "open": 1
        }
      }
    ]
  }
}
```

---

## 2. FUT Platform and Defects Overview

Retrieve the platform dashboard for a **FUT** task, including screening progress, tested OK status, defect counts per platform, and defect penetration rates.

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
curl -X GET "http://192.168.191.189:8001/api/v1/overviews/futs/tasks/0203f98f-d423-4e06-8677-447bbf9e9c0b" \
  -H "Authorization: Bearer <accessToken>"
```

### Response Example

**Status:** `200 OK`

```json
{
  "process_time": "803ms",
  "status": "success",
  "code": "",
  "message": "Successfully retrieved platform dashboard",
  "data": {
    "defects_penetration": {
      "total_defect": 9,
      "open": 3,
      "penetration_rate": 50,
      "critical": 0,
      "high": 0,
      "medium": 1,
      "minor": 0,
    },
    "platforms": [
      {
        "platform_id": 8,
        "platform_name": "Chrome Desktop",
        "screening": {
          "percentage": 0,
          "tc_execute": 0,
          "total_tc": 1
        },
        "tested_ok": {
          "percentage": 100,
          "tc_execute": 1,
          "total_tc": 1
        },
        "defects": {
          "critical": 0,
          "high": 0,
          "medium": 1,
          "minor": 0,
          "open": 1,
          "total": 3
        }
      }
    ],
    "key_features": [
      {
        "name": "aaaa",
        "tc_count": 0
      },
      {
        "name": "aaaaa",
        "tc_count": 0
      }
    ]
  }
}
```

---
