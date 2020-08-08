function! ReadSnippet(snippetName)
  return readfile($HOME . "/.config/nvim/snippets/" . a:snippetName)
endfunction

command! ConfigMap :call setbufline("", line("."), ReadSnippet("ConfigMap.yaml"))
command! CronJob :call setbufline("", line("."), ReadSnippet("CronJob.yaml"))
command! Deployment :call setbufline("", line("."), ReadSnippet("Deployment.yaml"))
command! HorizontalPodAutoscaler :call setbufline("", line("."), ReadSnippet("HorizontalPodAutoscaler.yaml"))
command! Ingress :call setbufline("", line("."), ReadSnippet("Ingress.yaml"))
command! Job :call setbufline("", line("."), ReadSnippet("Job.yaml"))
command! PersistentVolume :call setbufline("", line("."), ReadSnippet("PersistentVolume.yaml"))
command! PersistentVolumeClaim :call setbufline("", line("."), ReadSnippet("PersistentVolumeClaim.yaml"))
command! Role :call setbufline("", line("."), ReadSnippet("Role.yaml"))
command! RoleBinding :call setbufline("", line("."), ReadSnippet("RoleBinding.yaml"))
command! Service :call setbufline("", line("."), ReadSnippet("Service.yaml"))
command! ServiceAccount :call setbufline("", line("."), ReadSnippet("ServiceAccount.yaml"))
command! StatefulSet :call setbufline("", line("."), ReadSnippet("StatefulSet.yaml"))










