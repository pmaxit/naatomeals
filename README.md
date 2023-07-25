# naatomeals
A meal ordering service for home cooked foods


### Search bar as extension of app bar
Finally fixed the search bar as extension of app bar. Took more than 10 days but learnt a lot about SliverAppBar, AppBar in general. Few points to note.

```
          SliverPersistentHeader(
              delegate: CustomAppBar(
                child: buildSearchBar(),
                expandedHeight: 50,
              ),
              pinned: true),

```

### BuildSearchBar
contains Stack Widget with 
- upper half container equal to appbar color so that it can be mixed
- upper half container equal to gradient color so that it can be mixed with appbar gradient if any
- full container is filled with textfield with rounded bottom with padding on left & right

Since stack bar doesn't have any container in background. bottom half outside the search bar is still visible [ Finally found this trick ]


Few things I tried but didn't work out
- Extending search bar in flexible space but stack isn't responsive outside the flexible space bar
- Using it in bottom app bar. THis can't scroll the content underneath.
- Full stack app bar, again can't scroll the content in one widget but not to the other.


Good thing about this solution
- extended. We can use as many these widgets
- Moves with scroll
- Clean solution since it doesn't complicate the app bar widget


### TextField
New thing I found on textfield is we can align the text direction
```
            child: const TextField(
              textAlignVertical: TextAlignVertical.bottom,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: "Search...",
                labelStyle: TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
```
This fixes the textfield text alignment. We can decide if it's in middle or left.

