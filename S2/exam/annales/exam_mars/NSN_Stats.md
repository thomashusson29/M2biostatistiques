# NSN_Stats

Conversion en Markdown de [`NSN_Stats.pptx`](/Users/thomashusson/Documents/Projets/M2biostatistiques/S2/exam/annales/exam_mars/NSN_Stats.pptx), en combinant le texte natif du PowerPoint et l'OCR des formules embarquées en image.

## Slide 1 - Nombre de sujets nécessaires

- Bruno Falissard
- Université Paris-Saclay

## Slide 2 - Nombre de sujets nécessaires

- Rien à voir avec les stats !
- Un peu quand même...

## Slide 3 - Épidémiologie descriptive

## Slide 4 - Épidémiologie descriptive

- Précision d'un pourcentage (prévalence)

$$
\Delta = \pm 1.96 \sqrt{\frac{p(1-p)}{n}}
$$

## Slide 5 - Épidémiologie descriptive

- Précision d'un pourcentage (prévalence)
- Exemple: `p = 0.2`
- Exemple: `n = 1000`

## Slide 6 - Épidémiologie descriptive

- Précision d'un pourcentage (prévalence)
- Oui il faut parier sur `p` !
- Attention aux plans de sondage en grappe...

## Slide 7 - Épidémiologie analytique

## Slide 8 - Épidémiologie analytique

- Précision d'un OR

## Slide 9 - Épidémiologie analytique

- Précision d'un OR

|        | Cas | Tém. |
|--------|-----|------|
| Exp.   |     |      |
| N. exp.|     |      |
| Total  | 500 | 500  |

## Slide 10 - Épidémiologie analytique

- Précision d'un OR

|        | Cas | Tém. |
|--------|-----|------|
| Exp.   | 50  | 40   |
| N. exp.| 450 | 460  |
| Total  | 500 | 500  |

## Slide 11 - Épidémiologie analytique

- Précision d'un OR

|        | Cas | Tém. |
|--------|-----|------|
| Exp.   | 50  | 40   |
| N. exp.| 450 | 460  |
| Total  | 500 | 500  |

- `OR = 1.28`
- `log(OR) = 0.245`

## Slide 12 - Épidémiologie analytique

- Précision d'un OR

|        | Cas | Tém. |
|--------|-----|------|
| Exp.   | 50  | 40   |
| N. exp.| 450 | 460  |
| Total  | 500 | 500  |

- `OR = 1.28`
- `log(OR) = 0.245`

$$
sd[\log(OR)] = \sqrt{\frac{1}{50} + \frac{1}{450} + \frac{1}{40} + \frac{1}{460}} = 0.222
$$

## Slide 13 - Épidémiologie analytique

- Précision d'un OR

|        | Cas | Tém. |
|--------|-----|------|
| Exp.   | 50  | 40   |
| N. exp.| 450 | 460  |
| Total  | 500 | 500  |

- `OR = 1.28`
- `exp(0.245 - 2 × 0.222) = 0.8`
- `exp(0.245 + 2 × 0.222) = 2`

## Slide 14 - Essai thérapeutique

- Comparaison de deux pourcentages
- `$H_0 : p_1 = p_2$`
- `$H_A : p_1 - p_2 = \Delta$`
- `$\alpha$`
- `$\beta$`

## Slide 15 - Essai thérapeutique

- Comparaison de deux pourcentages

$$
n = (z_\alpha + z_\beta)^2 \frac{p_1(1-p_1) + p_2(1-p_2)}{(p_1-p_2)^2}
$$

## Slide 16 - Essai thérapeutique

- Comparaison de deux pourcentages: `p1 = 0.1`, `p2 = 0.2`

$$
n = (z_\alpha + z_\beta)^2 \frac{p_1(1-p_1) + p_2(1-p_2)}{(p_1-p_2)^2}
$$

## Slide 17 - Essai thérapeutique

```text
> n.for.2p(0.1, 0.2, alpha = 0.05, power = 0.8, ratio = 1)
Estimation of sample size for testing Ho: p1==p2
Assumptions:
  alpha = 0.05
  power = 0.8
  p1 = 0.1
  p2 = 0.2
  n2/n1 = 1
Estimated required sample size:
  n1 = 219
  n2 = 219
  n1 + n2 = 438
```

## Slide 18 - Essai thérapeutique

- Comparaison de deux moyennes
- `$H_0 : m_1 = m_2$`
- `$H_A : m_1 - m_2 = \Delta$`
- `$\alpha$`
- `$\beta$`

## Slide 19 - Essai thérapeutique

- Comparaison de deux moyennes
- `n.for.2means()`

$$
n = (z_\alpha + z_\beta)^2 \frac{2\sigma^2}{\Delta^2}
$$

## Slide 20 - Essai thérapeutique

- Groupes déséquilibrés (`n.for.2p`, `n.for.2means`)
- Log-rank (`cpower()` de `Hmisc` ou `powerSurvEpi`)
- Modèles mixtes (`SIMR`, `powerlmm`, ...)
- -> Épidémiologie analytique (hum hum...)
- -> Et pour le reste ?! (études diagnostiques par ex.)

## Slide 21 - Conclusion

- `€`
- Jurisprudence
- "Bon sens"
- Une formule (deux ?) qui aide à mettre à plat
- Mais que vaut `\Delta` ?...
