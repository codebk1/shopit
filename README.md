### :construction: WORK IN PROGRESS :construction:
<br>

![logo](https://github.com/codebk1/shopit/assets/20027710/2f67cede-2c58-42c9-b94d-2cb932e3ff02)

E-commerce application built with Flutter :blue_heart:

https://github.com/codebk1/shopit/assets/20027710/0e230058-b8db-4a81-a355-5fd5df5861f6

#### Features / edge cases:
- dependency injection and state management with riverpod,
- architecture with separate repositories and datasources, which allows easy extension for future local/remote datasources (still working on better architecture),
- go_router with StatefulNestedRoutes (still some bugs with redirection and indexed stack),
- combined freezed model and isar schema (allows to use same entity for local and remote database),
- separate isar schema and freezed model with mappers to map between local and remote data (nice separation for storing different data shapes for same feature in local and remote database).
- riverpod infinity scroll with known number of items for categories list (auto disposing pages on scroll, availability to set custom keepAlive cache) and unknown number of items for products list (ongoing states - loading more / loading more error - without extension on AsyncValue),

![ongoing-states](https://github.com/codebk1/shopit/assets/20027710/0b13b673-7265-433f-9f1f-aabc6a3bafea)

#### TODO:
- [ ] checkout & orders feature
- [ ] categories/products sorting and filters
- [ ] full-text search
- [x] l10n:

<img width="250px" src="https://github.com/codebk1/shopit/assets/20027710/df8c7a3d-2eb1-4ac6-9aca-b7b9be7ebc91">

- [ ] custom themes
- [ ] animations & microinteractions
- [ ] forms validation
- [ ] admin panel
- [ ] unit and widgets tests
- [x] flavors
- [x] Firebase Crashlytics
- [ ] GitHub Actions for CI/CD
- [ ] supabase datasources
