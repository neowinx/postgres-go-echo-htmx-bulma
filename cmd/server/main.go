package main

import (
	"context"
	"html/template"
	"io"
	"log"
	"os"
	"postgres-go-echo-htmx-bulma/internal/handler"

	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/labstack/echo/v4"
)

// Struct to hold template rendering
type TemplateRenderer struct {
    templates *template.Template
}

// Render renders the HTML templates
func (t *TemplateRenderer) Render(w io.Writer, name string, data interface{}, c echo.Context) error {
    // Execute the template with the provided data
    return t.templates.ExecuteTemplate(w, name, data)
}

func main() {

	// Get the database connection string from environment variable or configuration file
	connectionString := os.Getenv("DATABASE_URI")
	if connectionString == "" {
		log.Fatal("Database URI is not set")
	}

	// Initialize the configuration for the connection pool
	config, err := pgxpool.ParseConfig(connectionString)
	if err != nil {
		log.Fatalf("Error parsing connection string: %v", err)
	}

	// Initialize the connection pool
	dbpool, err := pgxpool.NewWithConfig(context.Background(), config)
	if err != nil {
		log.Fatalf("Error establishing connection pool: %v", err)
	}
	defer dbpool.Close()

	// Check if the connection is successful
	if err := dbpool.Ping(context.Background()); err != nil {
		log.Fatalf("Error connecting to the database: %v", err)
	}

	log.Println("Database connection established")

	// Create a new Echo instance
	e := echo.New()

  e.Renderer = &TemplateRenderer{ 
    templates: template.Must(template.ParseFiles("web/templates/index.html", "web/templates/heroes/list.html")),
  }

	// Initialize handlers and pass dbpool to them
	initHandlers(e, dbpool)

	// Start the server
	e.Logger.Fatal(e.Start(":8080"))
}

// Initialize handlers and pass dbpool to them
func initHandlers(e *echo.Echo, dbpool *pgxpool.Pool) {
	// Create handlers and pass dbpool to them
	e.GET("/", handler.HomeHandler())
	e.GET("/heroes", handler.ListHeroHandler(dbpool))
	e.GET("/heroes/add", handler.ListHeroHandler(dbpool))
  e.GET("/heroes/edit/:id", handler.ListHeroHandler(dbpool))
	e.POST("/heroes", handler.CreateHeroHandler(dbpool))
	e.GET("/heroes/:id", handler.GetHeroHandler(dbpool))
	e.PUT("/heroes/:id", handler.UpdateHeroHandler(dbpool))
	e.DELETE("/heroes/:id", handler.DeleteHeroHandler(dbpool))
}
