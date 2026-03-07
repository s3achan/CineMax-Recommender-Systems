# 🎬 CineMatch — Hybrid Movie Recommender System

> A hybrid recommendation engine combining **Content-Based Filtering** and **Collaborative Filtering** techniques to deliver personalized movie suggestions using the IMDB Movies Dataset.

---

## 📌 Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Project Structure](#project-structure)
- [Methodology](#methodology)
- [EDA Highlights](#eda-highlights)
- [Recommendation Engine](#recommendation-engine)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Results](#results)

---

## 🧠 Overview

CineMatch is a hybrid movie recommender system built on the IMDB Movies Dataset. It combines:

- **Content-Based Filtering** — recommends movies similar to a given title based on genres, directors, and cast using TF-IDF vectorization and cosine similarity.
- **User-Based Collaborative Filtering** — leverages user rating patterns to surface movies liked by similar users.

The hybrid approach addresses the limitations of each method individually — content-only systems are too narrow, while collaborative systems suffer from cold-start problems.

---

## 📂 Dataset

| Property | Detail |
|---|---|
| **Source** | [Kaggle — IMDB Movie Ratings Dataset](https://www.kaggle.com/datasets/thedevastator/imdb-movie-ratings-dataset) |
| **File** | `movie_data.csv` |

### Features

| Feature | Description |
|---|---|
| `director_name` | Director of the movie |
| `genres` | Pipe-separated genre tags (e.g. `Action\|Drama`) |
| `actor_1_name` | Primary actor |
| `actor_2_name` | Secondary actor |
| `actor_3_name` | Tertiary actor |
| `movie_title` | Official title |
| `imdb_score` | Rating on a 1–10 scale |
| `num_voted_users` | Number of IMDB user votes |
| `title_year` | Year of release |
| `duration` | Runtime in minutes |
| `language` | Primary language |
| `country` | Country of production |

---

## 📁 Project Structure

```
├── Hybrid-Recommender-System.ipynb   # Main notebook
├── movie_data.csv                    # Dataset
└── README.md
```

---

## 🔬 Methodology

### 1. Data Cleaning & Preprocessing
- Separated numeric and categorical features
- Imputed missing numeric values with **median**
- Imputed missing categorical values with `"Unknown"`
- Stripped invisible characters and whitespace from movie titles
- Validated data ranges and categorical consistency

### 2. Exploratory Data Analysis
- Distribution of IMDB scores
- Average score and duration trends over time
- Genre popularity and average ratings by genre
- Most active actors by movie count
- Top 10 most-voted movies

### 3. Feature Engineering
Combined text-based features into a single `features` column:
```python
imdb['features'] = (
    imdb['genres'] + " " +
    imdb['director_name'] + " " +
    imdb['actor_1_name'] + " " +
    imdb['actor_2_name'] + " " +
    imdb['actor_3_name']
)
```

### 4. Content-Based Filtering
- Applied **TF-IDF Vectorization** (`max_features=3000`, bigrams, `min_df=2`)
- Computed **Cosine Similarity** matrix across all movies
- Retrieved top-N most similar movies for any given title

---

## 📊 EDA Highlights

- 🎭 **Drama** is the most common genre, followed by **Comedy** and **Thriller**
- ⭐ IMDB scores are right-skewed — most movies cluster between **6.0 – 7.5**
- 🎬 **Robert De Niro** and **Nicolas Cage** lead in movie appearances
- 📈 Average movie ratings slightly declined post-2000
- 🔗 Engagement metrics (votes, reviews) are strongly correlated with each other but only moderately with IMDB score — popularity ≠ quality

---

## 🎯 Recommendation Engine

```python
get_recommendations("Avatar")
```

**Output:**
```
Recommended movies similar to Avatar:
1. Aliens
2. Titanic
3. Guardians of the Galaxy
4. Star Trek Into Darkness
...
```

The function:
1. Looks up the movie index
2. Retrieves its cosine similarity scores against all other movies
3. Returns the top 10 most similar titles (excluding itself)

---

## 🛠 Tech Stack

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-150458?logo=pandas)
![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-ML-F7931E?logo=scikit-learn)
![Seaborn](https://img.shields.io/badge/Seaborn-Visualization-4C72B0)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Plotting-11557c)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?logo=jupyter)

| Library | Purpose |
|---|---|
| `pandas` | Data loading, cleaning, transformation |
| `scikit-learn` | TF-IDF vectorization, cosine similarity |
| `matplotlib` | Plotting |
| `seaborn` | Statistical visualizations |

---


---

## ✅ Results

| Method | Strength |
|---|---|
| Content-Based | Strong at finding stylistically similar films (same director, cast, genre) |
| Collaborative | Captures user taste patterns beyond surface metadata |
| **Hybrid** | **Balances both — broader coverage, better cold-start handling** |

---

## 📬 Contact

Have suggestions or want to collaborate? Feel free to open an issue or reach out!

---

*Built with ❤️ using Python & IMDB data*