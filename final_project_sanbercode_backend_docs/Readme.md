# Introduction
Kami dari tim "threegonometries" yang beranggotakan
- Dzaki Ahnaf Zulfikar
- Gertrud Irish Jovincia
- Ayrisa Trianida

## Use Cases
ID : BakeNCake adalah sebuah aplikasi untuk mencari kue pilihan berdasarkan katalog tertentu.. tujuan aplikasi dibuat adalah ketika teman teman saudara atau keluarga ada pesta dalam waktu dekat, sehingga belum sempat datang ke toko, untuk itu kami dari Threegonometries membuat sebuah aplikasi agar yang memiliki fitur, Explore Shop untuk memperkenalkan berbagai toko kue lokal, sesuai dengan lokasi menjelajahi berbagai pilihan kue seperti chocolate cake, cheesecake, red velvet, hingga roti dan cookies lainnya. Saat salah satu produk dipilih, halaman detail menampilkan gambar yang menggoda, deskripsi produk, opsi ukuran, hingga perhitungan harga yang langsung otomatis. Aplikasi ini bukan sekadar tempat berbelanja, tapi juga sahabat terbaik untuk merayakan momen spesial atau sekadar memanjakan diri dengan sepotong kue lezat. Penggunaan sumber API : menggunakan APi dari mockAPI, yang menampilkan data products dan outlets.

EN : BakeNCake is an apps to find favorite cake, by catalog choosen, the reason this app born, it comes from events like friends birthday or family gathering in a close time, but don't have a time for visiting to the store, thats why we're from Threegonometries make some inovated apps with feature like, explore shop, for introducing like lokal cake outlet store, based from their place, and more delicious cake option, like chocolate cake, cheesecake, red velvet, bread, cokies, etc, if one of product is choosed or click, page detail show delicious cake image, product description, and cake size, until calculate price automaticly. This app doesn't only online shopping platform, but the best way for celebrating special moment, or like chilling yourself with a slice of cake. Usinig API Source : From MockAPi, Show products and outlet data.

## Authorization
Using firebase auth, just sign in and sign up like usual, also you can auth using a google account.

# Api Spec
## Products API
### Request
```http
GET https://67fa2a35094de2fe6ea3553e.mockapi.io/api/v1/products
```
get data of chocolate cake, cheesecake, red velvet, hingga roti dan cookies lainnya

| Query | Type | Description |
| :--- | :--- | :--- |
| `category` | `string` | **Optional**. Your Category can search and filter cake by category |

### Responses

```javascript
[
  {
    "product_name": "Chocolate Fudge Cake",
    "product_price": 75000,
    "product_description": "Rich and moist chocolate cake layered with dark fudge and topped with ganache.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830219/cake-1_njrgpo.jpg",
    "outlet": "toko-jakarta",
    "category": "Cake",
    "rating": "4.7",
    "rating_totals": 66,
    "created_at": "2025-04-18T14:19:28.479Z",
    "id": "1"
  },
  {
    "product_name": "Strawberry Slice",
    "product_price": 68000,
    "product_description": "Classic Strawberry cake with smooth cream cheese frosting and a hint of cocoa.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830219/cake-2_sqhc8z.jpg",
    "outlet": "toko-jakarta",
    "category": "Cake",
    "rating": "4.5",
    "rating_totals": 41,
    "created_at": "2025-04-18T14:08:32.719Z",
    "id": "2"
  },
  {
    "product_name": "Coffe Desert Cake",
    "product_price": 82000,
    "product_description": "Creamy Classic Italian dessert with layers of coffee-soaked sponge and mascarpone cream crust.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830221/cake-3_rsviqh.jpg",
    "outlet": "toko-jakarta",
    "category": "Cake",
    "rating": "4.6",
    "rating_totals": 29,
    "created_at": "2025-04-18T04:42:09.271Z",
    "id": "3"
  },
  {
    "product_name": "Star Cake",
    "product_price": 90000,
    "product_description": "-",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830226/cake-4_l3vfqw.jpg",
    "outlet": "toko-jakarta",
    "category": "Cake",
    "rating": "4.8",
    "rating_totals": 77,
    "created_at": "2025-04-18T03:02:26.451Z",
    "id": "4"
  },
  {
    "product_name": "Matcha Cake",
    "product_price": 72000,
    "product_description": "Soft cake baked with lightly sweetened matcha cream.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830221/cake-5_uhd5w3.jpg",
    "outlet": "toko-jakarta",
    "category": "Cake",
    "rating": "4.4",
    "rating_totals": 33,
    "created_at": "2025-04-18T07:23:47.952Z",
    "id": "5"
  },
  {
    "product_name": "Oreo Cookies",
    "product_price": 30000,
    "product_description": "Crispy on the outside and chewy inside, packed with dark chocolate chips.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830221/cookies-1_ydtwlt.jpg",
    "outlet": "toko-jakarta",
    "category": "Cookies",
    "rating": "4.6",
    "rating_totals": 8,
    "created_at": "2025-04-18T15:53:00.428Z",
    "id": "6"
  },
  {
    "product_name": "Oatmeal Raisin Cookies",
    "product_price": 28000,
    "product_description": "Wholesome cookies made with rolled oats and juicy raisins.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830222/cookies-2_b2byvv.jpg",
    "outlet": "toko-jakarta",
    "category": "Cookies",
    "rating": "4.2",
    "rating_totals": 63,
    "created_at": "2025-04-18T02:43:48.642Z",
    "id": "7"
  },
  {
    "product_name": "Chocolate Butter Cookies",
    "product_price": 29000,
    "product_description": "Soft and rich cookies with real chocolate butter and a pinch of sea salt.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830224/cookies-3_ikjbgz.jpg",
    "outlet": "toko-jakarta",
    "category": "Cookies",
    "rating": "4.5",
    "rating_totals": 87,
    "created_at": "2025-04-18T08:22:16.855Z",
    "id": "8"
  },
  {
    "product_name": "Double Chocolate Cookies",
    "product_price": 32000,
    "product_description": "Decadent cookies loaded with cocoa and chunks of dark chocolate.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830226/cookies-4_n2xdet.jpg",
    "outlet": "toko-jakarta",
    "category": "Cookies",
    "rating": "4.7",
    "rating_totals": 87,
    "created_at": "2025-04-18T15:33:51.205Z",
    "id": "9"
  },
  {
    "product_name": "Egg Butter Bread",
    "product_price": 25000,
    "product_description": "Fluffy bread brushed with egg, savory butter and baked to golden perfection.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830211/bread-1_kmp9dz.jpg",
    "outlet": "toko-jakarta",
    "category": "Bread",
    "rating": "4.6",
    "rating_totals": 79,
    "created_at": "2025-04-18T03:33:19.171Z",
    "id": "10"
  },
  {
    "product_name": "Japanese Crisp Milk Bread",
    "product_price": 27000,
    "product_description": "Soft, slightly sweet milk bread with a delicate crumb and golden crust.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830210/bread-2_pgdmhz.jpg",
    "outlet": "toko-jakarta",
    "category": "Bread",
    "rating": "4.5",
    "rating_totals": 95,
    "created_at": "2025-04-18T17:01:14.200Z",
    "id": "11"
  },
  {
    "product_name": "Sundy Snack",
    "product_price": 22000,
    "product_description": "Snack bar with kickback.",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830219/bvrg-1_jsjfwy.jpg",
    "outlet": "toko-jakarta",
    "category": "Beverage",
    "rating": "4.3",
    "rating_totals": 58,
    "created_at": "2025-04-18T11:57:00.966Z",
    "id": "12"
  },
  {
    "product_name": "Onion Salad",
    "product_price": 28000,
    "product_description": "-",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830212/bvrg-2_byjzmb.jpg",
    "outlet": "toko-jakarta",
    "category": "Beverage",
    "rating": "4.6",
    "rating_totals": 38,
    "created_at": "2025-04-18T08:58:05.329Z",
    "id": "13"
  },
  {
    "product_name": "Fried French Fries",
    "product_price": 26000,
    "product_description": "-",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830222/bvrg-3_sntkmf.jpg",
    "outlet": "toko-jakarta",
    "category": "Beverage",
    "rating": "4.4",
    "rating_totals": 10,
    "created_at": "2025-04-18T00:33:55.048Z",
    "id": "14"
  },
  {
    "product_name": "Fried Nuggets",
    "product_price": 22000,
    "product_description": "-",
    "is_favorite": false,
    "product_image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744831777/bvrg-4_bkclou.jpg",
    "outlet": "toko-jakarta",
    "category": "Beverage",
    "rating": "4.4",
    "rating_totals": 9,
    "created_at": "2025-04-18T06:25:22.105Z",
    "id": "15"
  }
]
```
### Status Codes

Returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |

## Outlets API
### Request
```http
GET https://67fa2a35094de2fe6ea3553e.mockapi.io/api/v1/outlets
```

### Responses

```javascript
[
  {
    "address": "Jakarta",
    "name": "outlet-jakarta",
    "image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830956/jakarta_dszwrz.jpg",
    "outlet_sells": 11,
    "created_at": "2025-04-17T20:13:22.503Z",
    "id": "1"
  },
  {
    "address": "Depok",
    "name": "outlet-depok",
    "image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830955/depok_np97ey.jpg",
    "outlet_sells": 7,
    "created_at": "2025-04-18T12:45:48.036Z",
    "id": "2"
  },
  {
    "address": "Bogor",
    "name": "outlet-bogor",
    "image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744831152/bogor_msrrst.png",
    "outlet_sells": 40,
    "created_at": "2025-04-18T13:04:20.889Z",
    "id": "3"
  },
  {
    "address": "Makasar",
    "name": "outlet-makasar",
    "image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744831017/makasar_jdo1ay.png",
    "outlet_sells": 21,
    "created_at": "2025-04-17T19:26:43.744Z",
    "id": "4"
  },
  {
    "address": "Klaten (Yogyakarta)",
    "name": "outlet-klaten",
    "image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1744830956/yogyakarta_nudwq7.jpg",
    "outlet_sells": 39,
    "created_at": "2025-04-18T13:13:50.769Z",
    "id": "5"
  },
  {
    "address": "Surabaya",
    "name": "outlet-surabaya",
    "image": "https://res.cloudinary.com/dgkvma38q/image/upload/v1745262517/surabaya_alu3ka.jpg",
    "outlet_sells": 20,
    "created_at": "2025-04-21T14:28:21.099Z",
    "id": "6"
  }
]
```
### Status Codes

Returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |
