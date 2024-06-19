<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/CSS/setting.css"/>

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Space Grotesk:wght@500&display=swap"
    />

    <style>
      @font-face {
        font-family: "Pretendard";
        src: url("./public/Pretendard-Regular.otf");
        font-weight: 400;
      }
    </style>
  </head>
  <body>

      <div class="div1">
        <div class="inner">
          <div class="parent">
            <div class="div2">감지 물체 설정</div>
            <div class="wrapper">
              <img class="icon" loading="lazy" alt="" 
              src="<%=request.getContextPath() %>/resources/statics/close.svg" />
            </div>
          </div>
        </div>
        <form class="frame-parent">
          <div class="container">
            <div class="div3">
              	감지할 물체에 대하여 활성화 비활성화 가능합니다.
            </div>
          </div>
          <div class="rectangle-wrapper">
            <div class="frame-child"></div>
          </div>
          <div class="day-destails-wrapper">
            <div class="day-destails">
              <div class="bird">bird</div>
              <div class="day-destails-inner">
                <div class="vector-parent">
                  <img
                    class="frame-item"
                    loading="lazy"
                    alt=""
                    src="./public/vector-2.svg"
                  />

                  <div class="component-1-wrapper">
                    <div class="component-1">
                      <div class="component-1-child"></div>
                      <div class="component-1-item"></div>
                      <img class="check-icon" alt="" 
                      src="<%=request.getContextPath() %>/resources/statics/check.svg" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="day-destails-wrapper">
            <div class="day-destails">
              <div class="bird">person</div>
              <div class="day-destails-inner">
                <div class="vector-parent">
                  <img
                    class="frame-item"
                    loading="lazy"
                    alt=""
                    src="./public/vector-2.svg"
                  />

                  <div class="component-1-wrapper">
                    <div class="component-1">
                      <div class="component-1-child"></div>
                      <div class="component-1-item"></div>
                      <img class="check-icon" alt="" 
                      src="<%=request.getContextPath() %>/resources/statics/check.svg" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="day-destails-wrapper">
            <div class="day-destails">
              <div class="bird">rat</div>
              <div class="day-destails-inner">
                <div class="vector-parent">
                  <img
                    class="frame-item"
                    loading="lazy"
                    alt=""
                    src="./public/vector-2.svg"
                  />

                  <div class="component-1-wrapper">
                    <div class="component-1">
                      <div class="component-1-child"></div>
                      <div class="component-1-item"></div>
                      <img class="check-icon" alt="" 
                      src="<%=request.getContextPath() %>/resources/statics/check.svg" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="day-destails-wrapper">
            <div class="day-destails">
              <div class="bird">dog</div>
              <div class="day-destails-inner">
                <div class="vector-parent">
                  <img
                    class="frame-item"
                    loading="lazy"
                    alt=""
                    src="./public/vector-2.svg"
                  />

                  <div class="component-1-wrapper">
                    <div class="component-1">
                      <div class="component-1-child"></div>
                      <div class="component-1-item"></div>
                      <img class="check-icon" alt="" 
                      src="<%=request.getContextPath() %>/resources/statics/check.svg" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="day-destails-wrapper">
            <div class="day-destails">
              <div class="bird">cat</div>
              <div class="day-destails-inner">
                <div class="vector-parent">
                  <img
                    class="frame-item"
                    loading="lazy"
                    alt=""
                    src="./public/vector-2.svg"
                  />

                  <div class="component-1-wrapper">
                    <div class="component-1">
                      <div class="component-1-child"></div>
                      <div class="component-1-item"></div>
                      <img class="check-icon" alt="" 
                      src="<%=request.getContextPath() %>/resources/statics/check.svg" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="day-destails-wrapper">
            <div class="day-destails">
              <div class="bird">deer</div>
              <div class="day-destails-inner">
                <div class="vector-parent">
                  <img
                    class="frame-item"
                    loading="lazy"
                    alt=""
                    src="./public/vector-2.svg"
                  />

                  <div class="component-1-wrapper">
                    <div class="component-1">
                      <div class="component-1-child"></div>
                      <div class="component-1-item"></div>
                      <img class="check-icon" alt="" 
                      src="<%=request.getContextPath() %>/resources/statics/check.svg" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
     
          <div class="rectangle-container">
            <div class="rectangle-div"></div>
          </div>
          <div class="buttons">
            <button class="button">
              <div class="group">
                <img class="icon1" alt="" src="./public/.svg" />

                <div class="div4">취소</div>
                <img class="icon2" alt="" src="./public/.svg" />
              </div>
            </button>
            <button class="button1">
              <div class="parent1">
                <img class="icon3" alt="" src="./public/.svg" />

                <div class="div5">확인</div>
                <img class="icon4" alt="" src="./public/.svg" />
              </div>
            </button>
          </div>
        </form>
        
        