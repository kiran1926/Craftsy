<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>
<%--load external signup css --%>
<link href="/pub/css/category.css" rel="stylesheet">

<section>
    <div class="container-fluid p-5 mt-5">
        <div class="row">
            <div class="col-md-3">
                <div class="card card-sh" style="border-radius: 10px">
                    <div class="card-header text-center fs-4" style="background-color: #711A4E; color: white; border-top-left-radius: 10px; border-top-right-radius: 10px ">Add Category</div>
                    <div class="card-body">
                        <form>
                            <div class="mb-3">
                                <label> Enter category</label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label> Status </label>
                                <div class="form-check custom-radio">
                                    <input class="form-check-input" type="radio" checked name="isActive" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Active
                                    </label>
                                </div>
                                <div class="form-check custom-radio">
                                    <input class="form-check-input" type="radio" name="isActive" id="flexRadioDefault2">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Inactive
                                    </label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label> Upload Image</label>
                                <input type="file" class="form-control">
                            </div>
                            <button class="btn col-md-12 mt-2">Save</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card card-sh"style="border-radius: 10px">
                    <div class="card-header text-center fs-4" style="background-color: #711A4E; color: white; border-top-left-radius: 10px; border-top-right-radius: 10px;">Category Details</div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Serial no.</th>
                                <th scope="col">Category</th>
                                <th scope="col">Status</th>
                                <th scope="col">Image</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Bamboo Artifacts</td>
                                <td>Active</td>
                                <td><img src="/pub/images/slider/basket-2.jpg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Ceramic Kitchenware</td>
                                <td>Active</td>
                                <td><img src="/pub/images/terracotta-kitchenware.jpeg" width="50px" height="50px"  ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Cultural Handicrafts</td>
                                <td>Active</td>
                                <td><img src="/pub/images/lippan-mirror.jpeg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Paintings</td>
                                <td>Active</td>
                                <td><img src="/pub/images/pichwai-painting.jpeg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>Pottery</td>
                                <td>Active</td>
                                <td><img src="/pub/images/slider/pots-4.jpg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">6</th>
                                <td>Sculptures</td>
                                <td>Active</td>
                                <td><img src="/pub/images/slider/ganesh-12.jpg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">7</th>
                                <td>Wall Hangings</td>
                                <td>Active</td>
                                <td><img src="/pub/images/terracotta-windchime.jpg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            <tr>
                                <th scope="row">8</th>
                                <td>Wooden Handicrafts</td>
                                <td>Active</td>
                                <td><img src="/pub/images/wooden-mugs.jpeg" width="50px" height="50px" ></td>
                                <td><a href="#"><i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-right: 10px; font-size: larger" ></i></a>
                                    <a href="#"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a></td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>