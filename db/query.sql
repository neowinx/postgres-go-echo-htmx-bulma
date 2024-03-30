-- name: GetHero :one
SELECT * FROM hero
WHERE id = $1 LIMIT 1;

-- name: ListHeros :many
SELECT * FROM hero
ORDER BY name;

-- name: CreateHeroWithID :one
INSERT INTO hero (
  id,
  name
) VALUES (
  $1,
  $2
)
RETURNING *;

-- name: CreateHero :one
INSERT INTO hero (
  name
) VALUES (
  $1
)
RETURNING *;

-- name: UpdateHero :exec
UPDATE hero
  set name = $2
WHERE id = $1;

-- name: DeleteHero :exec
DELETE FROM hero
WHERE id = $1;
