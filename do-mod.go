imageName, imageTag := splitImageName(image)
    endpoint := regUrl+"/api/storage/"+imageName+"/"+imageTag
    request, err := http.NewRequest(http.MethodGet, endpoint, nil)
    if err != nil {
        return err
    }
    request.Header.Add("Content-Type", "application/json")
    request.Header.Add("Authorization", "Bearer "+regToken)
    resp, err := httpClient.Do(request)
    if err != nil {
        return err
    }
    defer resp.Body.Close()
    if resp.StatusCode != http.StatusOK {
        return fmt.Errorf("request to fetch metadata for the image: %s failed with status code: %d",image, resp.StatusCode)
    }
    content, err := io.ReadAll(resp.Body)
    if err != nil {
        return err
    }
    fileInfo := FileInfo{}
    if err := json.Unmarshal(content, &fileInfo); err != nil {
        return err
    }
    imageMetaData.artifactLocation = fileInfo.DownloadUri
    imageMetaData.ArtifactCreateDate = fileInfo.Created
    imageMetaData.ArtifactId = fileInfo.Checksums["sha256"]
    return nil
