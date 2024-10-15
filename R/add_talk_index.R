#' Add Talk Index Page
#'
#' This function adds an index page to a talk repository using metadata from the active repository.
#' It is a wrapper around usethis::use_template('talk-index.qmd', package = 'cynthiahqy')
#' The template can be found in `cynthiahqy/inst/templates`.
#'
#' @param source A character string specifying the source file for the slides.
#' @param talk_metadata A list object with metadata related to the talk.
#' @inheritParams usethis::use_template
#' @param ... Additional optional arguments to update the default data list.
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' add_talk_index()
#' }
add_talk_index <- function(
    source = "slides.qmd",
    talk_metadata = yaml::read_yaml("_talk.yml"),
    data = list(
        title = talk_metadata$title,
        talk = list(
            date = talk_metadata$talk$date,
            venue = talk_metadata$talk$venue,
            location = talk_metadata$talk$location,
            format = talk_metadata$talk$format
        ),
        repo = list(
            remote = usethis::git_remotes()$origin,
            local = fs::path_file(usethis::proj_get())
        ),
        slides = list(
            pdf = fs::path_ext_set(source, ".pdf"),
            html = fs::path_ext_set(source, ".html"),
            source = source
        )
    ),
    save_as = "index.qmd",
    template = "talk-index.qmd",
    ...) {
    # create path directories
    dir <- fs::path_dir(save_as)
    fs::dir_create(dir)

    # update default data list with optional args
    dots <- rlang::dots_list(...)
    data <- utils::modifyList(data, dots)

    # use template
    usethis::use_template(template,
        save_as = save_as,
        data = data,
        package = "cynthtools",
        open = TRUE
    )
}
