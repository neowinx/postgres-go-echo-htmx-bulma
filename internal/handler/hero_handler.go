package handler

import (
	"context"
	"database/sql"
	"net/http"
	"strconv"

	"postgres-go-echo-htmx-bulma/pkg/db"

	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/labstack/echo/v4"
)

// Hero represents the Hero model.
type Hero struct {
	ID   *int   `json:"id,omitempty"`
	Name string `json:"name"`
}

//	 ListHeroHandler handles the listing of all heroes.
func ListHeroHandler(dbpool *pgxpool.Pool) echo.HandlerFunc {
	return func(c echo.Context) error {
		ctx := context.Background()
		heroes, err := db.New(dbpool).ListHeros(ctx)
		if err != nil {
			return c.Render(http.StatusInternalServerError, "internalServerError.html", nil)
		}

    ret := c.Render(http.StatusOK, "list.html", heroes)
    return ret
	}
}

// CreateHeroHandler handles the creation of a new hero.
func CreateHeroHandler(dbpool *pgxpool.Pool) echo.HandlerFunc {
	return func(c echo.Context) error {
		var hero Hero
		if err := c.Bind(&hero); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request payload"})
		}

		ctx := context.Background()

		// TODO: try to DRY this part
		if hero.ID == nil {
			result, err := db.New(dbpool).CreateHero(ctx, hero.Name)
			if err != nil {
				return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Failed to create hero"})
			}
			return c.JSON(http.StatusCreated, result)
		} else {
			arg := db.CreateHeroWithIDParams{
				ID:   int32(*hero.ID),
				Name: hero.Name,
			}
			result, err := db.New(dbpool).CreateHeroWithID(ctx, arg)
			if err != nil {
				return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Failed to create hero"})
			}
			return c.JSON(http.StatusCreated, result)
		}
	}
}

// GetHeroHandler retrieves a hero by ID.
func GetHeroHandler(dbpool *pgxpool.Pool) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := strconv.Atoi(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid ID in the request"})
		}

		ctx := context.Background()
		result, err := db.New(dbpool).GetHero(ctx, int32(id))
		if err == sql.ErrNoRows {
			return c.JSON(http.StatusNotFound, map[string]string{"error": "Hero not found"})
		} else if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Failed to fetch hero"})
		}

		return c.JSON(http.StatusOK, result)
	}
}

// UpdateHeroHandler updates a hero by ID.
func UpdateHeroHandler(dbpool *pgxpool.Pool) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := strconv.Atoi(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid ID in the request"})
		}

		var updatedHero Hero
		if err := c.Bind(&updatedHero); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request payload"})
		}

		ctx := context.Background()
		arg := db.UpdateHeroParams{
			ID:   int32(id),
			Name: updatedHero.Name,
		}
		err = db.New(dbpool).UpdateHero(ctx, arg)
		if err == sql.ErrNoRows {
			return c.JSON(http.StatusNotFound, map[string]string{"error": "Hero not found"})
		} else if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Failed to update hero"})
		}

		return c.JSON(http.StatusOK, map[string]string{"message": "Hero updated successfully"})
	}
}

// DeleteHeroHandler deletes a hero by ID.
func DeleteHeroHandler(dbpool *pgxpool.Pool) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := strconv.Atoi(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid ID in the request"})
		}

		ctx := context.Background()
		err = db.New(dbpool).DeleteHero(ctx, int32(id))
		if err == sql.ErrNoRows {
			return c.JSON(http.StatusNotFound, map[string]string{"error": "Hero not found"})
		} else if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Failed to delete hero"})
		}

		return c.NoContent(http.StatusNoContent)
	}
}
