[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/m25FXJZ4)
# Pizza Front — Actividad Flexbox

**Profesor:** Ing. Fabio D. Argañaraz  
**Tema:** Maquetado con Flexbox

---

## Descripción del Repositorio

Este repositorio contiene el proyecto base para la actividad práctica de **Flexbox** correspondiente al desarrollo Front End. Se trata de una landing page para "Pizza Front", una pizzería ficticia, en la cual deberás aplicar las reglas de CSS Flexbox necesarias para lograr un maquetado flexible a partir del diseño de referencia.

### Estructura del Proyecto

```
Ejercitacion-FlexBox/
├── css/
│   └── style_base.css    # Estilos base (con indicaciones de dónde añadir flex)
├── img/                  # Recursos gráficos y bocetos
│   ├── VectorPizza.svg   # Logo
│   └── (bocetos desktop y mobile)
├── index.html            # Estructura HTML
├── scripts/
│   └── classroom-check.sh  # Pruebas locales / GitHub Classroom
└── README.md
```

### Diseño de Referencia

- **Figma (diseño completo — curso):** [Pizza Front](https://www.figma.com/design/txKZ0RGGen4Omwsqe2l2J5/Pizza-Front?node-id=0-1)
- **Figma (referencia histórica AP):** [AP - Pizza Front](https://www.figma.com/file/V59fTBmFIscaVIlF9uRvlB/AP---Pizza-Front?type=design&node-id=0%3A1&t=8QhPGtA3iFkZUUpu-1)
- **Bocetos:** En la carpeta `img/` encontrarás los bocetos de cómo debe verse el sitio en vista **desktop** y **mobile**.

### Autoevaluación (GitHub Classroom / CI)

En el repositorio hay comprobaciones automáticas alineadas con la consigna. Podés ejecutarlas en local (con Bash, por ejemplo Git Bash en Windows):

```bash
bash scripts/classroom-check.sh all
```

Cada subcomando (`base-structure`, `css-linked`, `semantic-html`, `flexbox-header`, `flexbox-main`, `flexbox-footer`) imprime exactamente `CORRECTO` si pasa. Lo que depende de **fidelidad a Figma** (proporciones, detalle visual) no se automatiza: revisá el issue **«[Revisión docente] Figma…»** cuando el remoto cree las issues.

---

## Objetivo

Una de las principales tareas de un desarrollador Front End es tanto **estructurar interfaces** como **aplicar estilos** a partir de un wireframe o una imagen.

El desafío será reconocer las diferentes etiquetas y los correspondientes estilos que podrían conformar el maquetado y diseño para comenzar a estructurar un archivo hasta obtener un resultado visual **similar a la referencia**.

En esta oportunidad utilizaremos un proyecto base y añadiremos **Flexbox** a sus elementos según sea necesario.

---

## Desafío

Utilizando el proyecto disponible en la consigna, la propuesta para esta clase es que puedan:

1. **Añadir las reglas necesarias** para que el mismo sea flexible (Flexbox).

### Pistas en el código

En `style_base.css` encontrarás comentarios `/*Añadimos flex*/` que indican los lugares donde se recomienda aplicar las propiedades de Flexbox:

- `header`
- `header nav ul`
- `header .header__logo`
- `main .container`
- `main section .podio`
- `.top5`
- `.top5 .podio__img`
- `footer`
- `footer .footer__logo`
- `footer ul`

---

## Conclusión

Antes de concentrarnos en el código, un ejercicio interesante es comprender **cuáles serán los elementos que necesitaremos** para estructurar un sitio.

Esto nos dará la posibilidad de tomar decisiones fáciles de modificar ya que, una vez hecho esto, el proceso de estructurar HTML será solo insertar etiquetas con sus valores correspondientes.

**Pensemos también qué reglas CSS podemos utilizar para lograr el resultado deseado.**

¡Hasta la próxima!

---

## Recursos de Referencia

- [Flexbox - MDN Web Docs](https://developer.mozilla.org/es/docs/Web/CSS/CSS_Flexible_Box_Layout)
- [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Diseño en Figma (Pizza Front)](https://www.figma.com/design/txKZ0RGGen4Omwsqe2l2J5/Pizza-Front?node-id=0-1)
