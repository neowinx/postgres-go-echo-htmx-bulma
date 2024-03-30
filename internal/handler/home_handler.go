package handler

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

//	 ListHeroHandler handles the listing of all heroes.
func HomeHandler() echo.HandlerFunc {
	return func(c echo.Context) error {
    return c.Render(http.StatusOK, "index.html", nil)
	}
}

