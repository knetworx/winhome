" Unreal Engine macro syntax highlighting
" Add to ~/.vim/after/syntax/cpp.vim (or source directly)
if g:vimrcdebug | echom "Running unreal.vim" | endif

" ============================================================
" Core reflection macros
" ============================================================
syn keyword unrealMacro
    \ UCLASS USTRUCT UENUM UINTERFACE UDELEGATE
    \ UPROPERTY UFUNCTION UMETA UPARAM

" ============================================================
" Boilerplate / generated macros
" ============================================================
syn keyword unrealGenerated
    \ GENERATED_BODY GENERATED_UCLASS_BODY GENERATED_USTRUCT_BODY
    \ GENERATED_UINTERFACE_BODY GENERATED_IINTERFACE_BODY

" ============================================================
" Common UPROPERTY specifiers
" ============================================================
syn keyword unrealSpecifier
    \ EditAnywhere EditDefaultsOnly EditInstanceOnly EditFixedSize
    \ VisibleAnywhere VisibleDefaultsOnly VisibleInstanceOnly
    \ BlueprintReadWrite BlueprintReadOnly BlueprintGetter BlueprintSetter
    \ Category DisplayName ToolTip
    \ Replicated ReplicatedUsing NotReplicated
    \ Transient SaveGame Config GlobalConfig
    \ Instanced Export NoClear
    \ AdvancedDisplay AssetRegistrySearchable Interp
    \ SimpleDisplay AllowPrivateAccess SkipSerialization
    \ TextExportTransient NonTransactional

" ============================================================
" Common UFUNCTION specifiers
" ============================================================
syn keyword unrealSpecifier
    \ BlueprintCallable BlueprintPure BlueprintImplementableEvent
    \ BlueprintNativeEvent BlueprintAuthorityOnly BlueprintCosmetic
    \ Server Client NetMulticast Reliable Unreliable WithValidation
    \ Exec CallInEditor Category DisplayName
    \ SealedEvent ServiceRequest ServiceResponse
    \ CustomThunk

" ============================================================
" Common UCLASS / USTRUCT specifiers
" ============================================================
syn keyword unrealSpecifier
    \ Blueprintable NotBlueprintable BlueprintType NotBlueprintType
    \ Abstract Transient Within MinimalAPI
    \ HideDropdown HideCategories ShowCategories
    \ ClassGroup CollapseCategories DontCollapseCategories
    \ ConversionRoot CustomConstructor DefaultToInstanced
    \ Deprecated NotPlaceable Placeable

" ============================================================
" Delegate macros
" ============================================================
syn match unrealDelegate
    \ "\<DECLARE_\(DYNAMIC_\)\?\(MULTICAST_\)\?\(SPARSE_\)\?DELEGATE\(_\w\+\)\?"

" ============================================================
" Check / ensure / log macros
" ============================================================
syn keyword unrealAssert
    \ check checkf checkCode checkNoEntry checkNoReentry checkNoRecursion
    \ ensure ensureMsgf ensureAlways
    \ verify verifyf
    \ checkSlow checkfSlow verifySlow

syn keyword unrealLog
    \ UE_LOG UE_LOGFMT UE_CLOG

" ============================================================
" Highlights — tweak colours to taste
" ============================================================
hi def link unrealMacro      Macro
hi def link unrealGenerated  Special
hi def link unrealSpecifier  Type
hi def link unrealDelegate   Macro
hi def link unrealAssert     Debug
hi def link unrealLog        Function
