#' Create a New Blog Post
#'
#' This function creates a new blog post with the specified parameters.
#' It is a light wrapper around usethis::use_template('blog-post.qmd', package = 'cynthiahqy')
#' The template 'blog-post.qmd' can be found in `cynthiahqy/inst/templates`.
#'
#' @param slug A character string representing the slug for the blog post.
#' @inheritParams usethis::use_template
#' @param ... Additional optional arguments to update the default data list.
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' # Note: running this will write `my-third-post/index.qmd` to your working directory
#' new_blog_post("my-third-post", categories = list("quarto", "git"))
#' }
new_blog_post <- function(
    slug,
    save_as = fs::path(slug, "index.qmd"),
    template = "blog-post.qmd",
    data = list(
        title = "",
        description = "",
        date = Sys.Date(),
        draft = "true",
        categories = list()
    ),
    ...) {
    # create path directories
    dir <- fs::path_dir(save_as)
    fs::dir_create(dir)

    # update default data list with optional args
    dots <- rlang::dots_list(...)
    data <- modifyList(data, dots)

    # use template
    usethis::use_template(template,
        save_as = save_as,
        data = data,
        package = "cynthiahqy",
        open = TRUE
    )
}
