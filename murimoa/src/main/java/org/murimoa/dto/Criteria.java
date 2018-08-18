package org.murimoa.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
    
	protected int page;
    protected int total;
    protected int gno;
    
    public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public Criteria() {
        this(1);
    }
    
    public Criteria(int page) {
        if(page <= 0) {
            page = 1;
        }  
        this.page = page;
    }
    
    public void setPage(int page) {
        if(page <= 0) {
            page = 1;
        }
        this.page = page;
    }
    
    public int getPage() {
        return page;
    }
    
    public void setTotal(int total) {
        this.total = total;
    }
    
    public int getTotal() {
        return total;
    }
    
    public int getSkip() {
        return (this.page -1) * 10 ;
    }
    
    @Override
    public String toString() {
        return "Criteria [page=" + page + ", total=" + total + "]";
    }
    
    public String getURI() {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .build();
        return uriComponents.toUriString();
    }
}





