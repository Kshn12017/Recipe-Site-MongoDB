package com.example.recipe;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;

public class RecipeDAO {

    private final MongoClient mongoClient;
    private final MongoDatabase database;
    private final MongoCollection<Document> collection;

    public RecipeDAO() {
        mongoClient = new MongoClient("localhost", 27017);
        database = mongoClient.getDatabase("recipe_db");
        collection = database.getCollection("recipes");
    }

    public void addRecipe(Recipe recipe) {
        Document doc = new Document("title", recipe.getTitle())
                .append("preparationTime", recipe.getPreparationTime())
                .append("ingredients", recipe.getIngredients())
                .append("steps", recipe.getSteps())
                .append("imageUrl", recipe.getImageUrl());
        collection.insertOne(doc);
    }

    public List<Recipe> getAllRecipes() {
        List<Recipe> recipes = new ArrayList<>();
        for (Document doc : collection.find()) {
            Recipe recipe = new Recipe(
                    doc.getString("title"),
                    doc.getString("preparationTime"),
                    doc.getString("ingredients"),
                    doc.getString("steps"),
                    doc.getString("imageUrl")
            );
            recipe.setId(doc.getObjectId("_id").toString());
            recipes.add(recipe);
        }
        return recipes;
    }

    public Recipe getRecipeById(String id) {
        Document doc = collection.find(eq("_id", new ObjectId(id))).first();
        if (doc != null) {
            Recipe recipe = new Recipe(
                    doc.getString("title"),
                    doc.getString("preparationTime"),
                    doc.getString("ingredients"),
                    doc.getString("steps"),
                    doc.getString("imageUrl")
            );
            recipe.setId(doc.getObjectId("_id").toString());
            return recipe;
        }
        return null;
    }

    public void updateRecipe(Recipe recipe) {
        Document updatedDoc = new Document("title", recipe.getTitle())
                .append("preparationTime", recipe.getPreparationTime())
                .append("ingredients", recipe.getIngredients())
                .append("steps", recipe.getSteps())
                .append("imageUrl", recipe.getImageUrl());
        collection.updateOne(eq("_id", new ObjectId(recipe.getId())), new Document("$set", updatedDoc));
    }

    public void deleteRecipe(String id) {
        collection.deleteOne(eq("_id", new ObjectId(id)));
    }

    public List<Recipe> searchRecipesByTitle(String title) {
        List<Recipe> recipes = new ArrayList<>();
        for (Document doc : collection.find(Filters.regex("title", title, "i"))) {
            Recipe recipe = new Recipe(
                    doc.getString("title"),
                    doc.getString("preparationTime"),
                    doc.getString("ingredients"),
                    doc.getString("steps"),
                    doc.getString("imageUrl")
            );
            recipe.setId(doc.getObjectId("_id").toString());
            recipes.add(recipe);
        }
        return recipes;
    }
}
