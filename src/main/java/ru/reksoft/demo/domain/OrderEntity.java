package ru.reksoft.demo.domain;

import ru.reksoft.demo.domain.generic.AbstractIdentifiedEntity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "order")
public class OrderEntity extends AbstractIdentifiedEntity {

    @Basic
    @Column(name = "address")
    private String address;

    @Basic
    @Column(name = "ordered")
    private Timestamp orderedTime;

    @OneToMany(mappedBy = "order")
    private Collection<MediaOrderEntity> media;

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "id", nullable = false)
    private OrderStatusEntity status;


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getOrderedTime() {
        return orderedTime;
    }

    public void setOrderedTime(Timestamp orderedTime) {
        this.orderedTime = orderedTime;
    }

    public Collection<MediaOrderEntity> getMedia() {
        return media;
    }

    public void setMedia(Collection<MediaOrderEntity> media) {
        this.media = media;
    }

    public OrderStatusEntity getStatus() {
        return status;
    }

    public void setStatus(OrderStatusEntity status) {
        this.status = status;
    }
}
