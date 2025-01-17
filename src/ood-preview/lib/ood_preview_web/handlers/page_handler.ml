let index _req =
  Layout_template.render ~title:"Welcome to Dream!" Index_template.render
  |> Dream.html

let papers _req =
  let papers = Ood_preview.Paper.all () in
  Layout_template.render ~title:"Papers" (Papers_template.render papers)
  |> Dream.html

let success_stories _req =
  let success_stories = Ood_preview.Success_story.all () in
  Layout_template.render
    ~title:"Success Stories"
    (Success_stories_template.render success_stories)
  |> Dream.html

let industrial_users _req =
  let industrial_users = Ood_preview.Industrial_user.all () in
  Layout_template.render
    ~title:"Industrial Users"
    (Industrial_users_template.render industrial_users)
  |> Dream.html

let academic_institutions _req =
  let institutions = Ood_preview.Academic_institution.all () in
  Layout_template.render
    ~title:"Academic Excellence"
    (Academic_excellence_template.render institutions)
  |> Dream.html

let consortium _req =
  let consortium = Ood_preview.Industrial_user.get_consortium () in
  Layout_template.render
    ~title:"Consortium"
    (Industrial_users_template.render consortium)
  |> Dream.html

let books _req =
  let books = Ood_preview.Book.all () in
  Layout_template.render ~title:"Books" (Books_template.render books)
  |> Dream.html

let events _req =
  let events = Ood_preview.Event.all () in
  Layout_template.render ~title:"Events" (Events_template.render events)
  |> Dream.html

let videos _req =
  let videos = Ood_preview.Video.all () in
  Layout_template.render ~title:"Videos" (Videos_template.render videos)
  |> Dream.html

let tutorial req =
  let slug = Dream.param "id" req in
  let tutorials = Ood_preview.Tutorial.all () in
  match Ood_preview.Tutorial.get_by_slug slug with
  | Some tutorial ->
    Layout_template.render
      ~title:tutorial.Ood_preview.Tutorial.title
      (Tutorial_template.render tutorials tutorial)
    |> Dream.html
  | None ->
    Dream.not_found req

let tutorials req =
  let first = Ood_preview.Tutorial.all () |> List.hd in
  let slug = Ood_preview.Tutorial.slug first in
  Dream.redirect req ("/tutorials/" ^ slug)

let tools _req =
  let tools = Ood_preview.Tool.all () in
  Layout_template.render ~title:"Tools" (Platform_template.render tools)
  |> Dream.html
