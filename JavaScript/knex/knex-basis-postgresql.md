# 🧠 Knex.js + PostgreSQL Table Options Cheat Sheet

## 🧾 Column Types (PostgreSQL Friendly)

| Column Type  | Knex Method                                      | Notes                                                   |
| ------------ | ------------------------------------------------ | ------------------------------------------------------- |
| Primary ID   | `table.increments('id')`                         | Auto-incremented integer (serial)                       |
| UUID         | `table.uuid('id')`                               | You generate UUIDs manually or with `gen_random_uuid()` |
| String       | `table.string('title', [length])`                | `varchar`, max 255 by default                           |
| Text         | `table.text('content')`                          | Unlimited length                                        |
| Integer      | `table.integer('count')`                         | 4-byte signed integer                                   |
| BigInt       | `table.bigInteger('views')`                      | 8-byte integer                                          |
| Float        | `table.float('rating')`                          | Approx. number                                          |
| Decimal      | `table.decimal('price', 8, 2)`                   | Exact decimal – for currency                            |
| Boolean      | `table.boolean('is_active')`                     | true / false                                            |
| Date         | `table.date('birth_date')`                       | Date only                                               |
| Timestamp    | `table.timestamp('created_at', { useTz: true })` | With time zone                                          |
| Timestamps   | `table.timestamps(true, true)`                   | `created_at`, `updated_at` (default to now)             |
| Enum         | `table.enu('status', ['draft', 'published'])`    | Postgres maps this to `TEXT` by default                 |
| JSON / JSONB | `table.json('data')` / `table.jsonb('data')`     | For structured or searchable data                       |

---

## 🔗 Relationships & Foreign Keys

| Purpose          | Example                                                                 |
| ---------------- | ----------------------------------------------------------------------- |
| Foreign key      | `table.integer('user_id').unsigned().references('id').inTable('users')` |
| UUID foreign key | `table.uuid('user_id').references('id').inTable('users')`               |
| Cascade delete   | `.onDelete('CASCADE')`                                                  |
| Cascade update   | `.onUpdate('CASCADE')`                                                  |

---

## 🔒 Constraints & Indexes

| Constraint    | Example                                           |
| ------------- | ------------------------------------------------- |
| Required      | `.notNullable()`                                  |
| Nullable      | `.nullable()`                                     |
| Default value | `.defaultTo(true)` or `.defaultTo(knex.fn.now())` |
| Unique        | `.unique()`                                       |
| Primary key   | `.primary()`                                      |
| Index         | `.index()`                                        |
| Composite key | `.primary(['col1', 'col2'])`                      |

---

## 🛠 Table Options (Postgres-compatible)

| Option                 | Example                            |
| ---------------------- | ---------------------------------- |
| Drop column            | `table.dropColumn('col')`          |
| Rename column          | `table.renameColumn('old', 'new')` |
| Add comment            | `table.comment('Products table')`  |
| Set charset/collation  | Usually not needed in Postgres     |
| Table-specific primary | `table.primary(['id', 'locale'])`  |

---

# ✅ Full Table Example – PostgreSQL Optimized

````js
exports.up = function(knex) {
  return knex.schema.createTable('products', function(table) {
    table.increments('id').primary();                                // Auto ID
    table.string('name', 150).notNullable().unique();                // Required + unique name
    table.text('description');                                       // Optional
    table.decimal('price', 10, 2).notNullable();                     // Currency
    table.integer('stock').notNullable().defaultTo(0);              // Inventory count
    table.boolean('is_active').notNullable().defaultTo(true);        // Status
    table.enu('status', ['draft', 'published', 'archived'])          // Enum status
         .notNullable().defaultTo('draft');

    table.uuid('vendor_id')                                          // UUID foreign key
         .references('id').inTable('vendors')
         .onDelete('SET NULL')
         .onUpdate('CASCADE');

    table.jsonb('metadata');                                         // Searchable JSON
    table.timestamp('available_from', { useTz: true });              // Optional timestamp
    table.timestamps(true, true);                                    // created_at, updated_at

    table.index(['vendor_id']);                                      // Index for fast filtering
  });
};

exports.down = function(knex) {
  return knex.schema.dropTable('products');
};


---

# ✅ Migration Table Example – PostgreSQL Optimized

```js
// migrations/20250503121000_create_users_and_profiles.js

/**
 * This migration demonstrates common table options in Knex.
 */
export async function up(knex) {
  await knex.schema.createTable('users', (table) => {
    table.increments('id').primary(); // Auto-incrementing primary key
    table.string('username', 50).notNullable().unique(); // String with max length, required, unique
    table.string('email').notNullable().unique();        // Unique email
    table.string('password_hash').notNullable();         // Password hash
    table.boolean('is_active').defaultTo(true);          // Boolean flag with default
    table.timestamp('created_at').defaultTo(knex.fn.now()); // Timestamp with default
    table.timestamp('updated_at').defaultTo(knex.fn.now());
  });

  await knex.schema.createTable('profiles', (table) => {
    table.increments('id');
    table.integer('user_id').unsigned().references('id').inTable('users').onDelete('CASCADE');
    table.text('bio');                          // Text column
    table.string('avatar_url');                // Optional string
    table.date('birthdate');                   // Date type
    table.enu('gender', ['male', 'female', 'other']); // Enum
    table.jsonb('preferences');                // JSONB column (PostgreSQL only)
    table.timestamps(true, true);              // created_at and updated_at with defaults
  });
}

/**
 * Drops both tables if rolled back.
 */
export async function down(knex) {
  await knex.schema.dropTableIfExists('profiles');
  await knex.schema.dropTableIfExists('users');
}
````
