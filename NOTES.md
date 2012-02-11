# NOTES

## Exhibit A

Previously we started from the view. Here we write loads of code which isn't
driven by anything. Perhaps starting with the code we want in the view would
help this make more sense. So we would have something like

    The code we want to have is

    <article>
      <header>
        <p><time pubdate="pubdate"><%= entry.pubdate %></time></p>
        <h3><%= entry.title %></h3>
      </header>
      <%= entry.render_body %>
    </article>

    This requires a different object that 'decorates' our post with the ability
    to choose the correct partial ...



