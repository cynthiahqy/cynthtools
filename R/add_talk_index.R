#' Generate Talk YAML Header
#'
#' This function generates the YAML header for a talk page and
#' adds it to the clipboard
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
clip_talk_index <- function(
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
    ...) {
    # update default data list with optional args
    dots <- rlang::dots_list(...)
    data <- utils::modifyList(data, dots)

    # use template
    template <- readLines(
        fs::path_package("cynthtools", "templates", "talk-index.txt")
    )
    output <- whisker::whisker.render(template, data)
    cat(output)
    clipr::write_clip(output, allow_non_interactive = TRUE)
    invisible(output)
}
