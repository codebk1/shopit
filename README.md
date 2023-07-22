### :construction: WORK IN PROGRESS :construction:
<br>

![shopit](https://github.com/codebk1/shopit/assets/20027710/f4f27989-486a-49ca-b6e2-bff8d9c2232c)

E-commerce application built with Flutter :blue_heart:

https://github.com/codebk1/shopit/assets/20027710/f2bfb083-b0d7-42b2-b12b-0e02172b2ead

<br>

#### Features / edge cases:
- dependency injection and state management with riverpod,
- architecture with separate repositories and datasources, which allows easy extension for future local/remote datasources (still working on better architecture),
- go_router with StatefulNestedRoutes (still some bugs with redirection and indexed stack),
- combined freezed model and isar schema (allows to use same entity for local and remote database),
- separate isar schema and freezed model with mappers to map between local and remote data (nice separation for storing different data shapes for same feature in local and remote database).
- riverpod infinity scroll with known number of items for categories list (auto disposing pages on scroll, availability to set custom keepAlive cache) and unknown number of items for products list (ongoing states - loading more / loading more error - without extension on AsyncValue),

![ongoing-states](https://github.com/codebk1/shopit/assets/20027710/15f3afe9-a82c-4c6c-83c9-819f3a3461e5)

#### TODO:
- [ ] checkout & orders feature
- [ ] categories/products sorting and filters
- [ ] full-text search
- [ ] custom themes
- [ ] animations & microinteractions
- [ ] forms validation
- [ ] admin panel
- [ ] unit and widgets tests
- [ ] flavors
- [ ] Firebase Crashlytics
- [ ] GitHub Actions for CI/CD
- [ ] supabase datasources
