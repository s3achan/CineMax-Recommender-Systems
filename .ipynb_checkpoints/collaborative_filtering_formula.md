# Collaborative Filtering Formula

## Core Formula

$$\hat{r}_{u,m} = \bar{r}_u + \frac{\sum_{v \in N} sim(u,v) \cdot (r_{v,m} - \bar{r}_v)}{\sum_{v \in N} |sim(u,v)|}$$

## What Each Symbol Means

| Symbol | Meaning |
|--------|---------|
| $\hat{r}_{u,m}$ | **Predicted rating** for target user $u$ on movie $m$ |
| $\bar{r}_u$ | **Target user's mean** rating across all movies |
| $v \in N$ | Each **similar user** in the neighbourhood |
| $sim(u,v)$ | **Similarity score** between target user $u$ and similar user $v$ |
| $r_{v,m}$ | Similar user $v$'s **actual rating** of movie $m$ |
| $\bar{r}_v$ | Similar user $v$'s **mean rating** across all movies |

---

## Breaking It Down

### Step 1 — Normalize each similar user's rating
$$r_{v,m} - \bar{r}_v$$
> Removes rating bias. A harsh rater giving 4★ means more than a generous rater giving 4★.

### Step 2 — Weight by similarity
$$sim(u,v) \cdot (r_{v,m} - \bar{r}_v)$$
> Users more similar to you have more influence on the prediction.

### Step 3 — Average the weighted deviations
$$\frac{\sum_{v \in N} sim(u,v) \cdot (r_{v,m} - \bar{r}_v)}{\sum_{v \in N} |sim(u,v)|}$$
> Dividing by the sum of similarities gives a properly scaled weighted average.

### Step 4 — Add target user's baseline
$$\hat{r}_{u,m} = \bar{r}_u + \text{weighted average deviation}$$
> Anchors the prediction around your own rating habits.

---

## In Plain English

```
predicted rating = your average rating
                 + how much similar users liked this movie
                   above or below their own average
                   (weighted by how similar they are to you)
```

---

## Code Mapping

```python
target_mean                  # r̄_u  — your mean rating
normalized_rating            # r_v,m - r̄_v  — deviation from their mean
weighted_rating              # sim(u,v) × normalized_rating
weighted_sum / similarity_sum  # the full fraction
target_mean + (weighted_sum / similarity_sum)  # final predicted rating
```
