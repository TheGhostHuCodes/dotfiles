function! Sorted(list)
    let new_list = deepcopy(a:list)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(list)
    let new_list = deepcopy(a:list)
    call reverse(new_list)
    return new_list
endfunction

function! Append(list, val)
    let new_list = deepcopy(a:list)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(container, i, val)
    let new_container= deepcopy(a:container)
    let new_container[a:i] = a:val
    return new_container
endfunction

function! Pop(container, i)
    let new_container = deepcopy(a:container)
    if type(a:container) == type({})
        unlet new_container[a:i]
    else
        call remove(new_container, a:i)
    endif
    return new_container
endfunction

function! Mapped(fn, container)
    let new_container = deepcopy(a:container)
    if type(a:container) == type({}) || type(a:container) == type([])
        call map(new_container, string(a:fn) . '(v:val)')
    else
        echo "Error! Map only supports List or Dictionary"
    endif
    return new_container
endfunction

function! Reduce(fn, container)
    let new_container = deepcopy(a:container)
    let [acc; tail] = new_container
    while !empty(tail)
        let [head; tail] = tail
        let acc = a:fn(acc, head)
    endwhile
    return acc
endfunction

function! Filtered(fn, container)
    let new_container = deepcopy(a:container)
    if type(a:container) == type({}) || type(a:container) == type([])
        call filter(new_container, string(a:fn) . '(v:val)')
    else
        echo "Error! Map only supports List or Dictionary"
    endif
    return new_container
endfunction

function! Removed(fn, container)
    let new_container = deepcopy(a:container)
    if type(a:container) == type({}) || type(a:container) == type([])
        call filter(new_container, '!' . string(a:fn) . '(v:val)')
    else
        echo "Error! Map only supports List or Dictionary"
    endif
    return new_container
endfunction
