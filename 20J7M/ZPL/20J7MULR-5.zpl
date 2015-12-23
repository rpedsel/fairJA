set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.6597, <2> 2.1798, <3> 16.1372, <4> 15.0469, <5> 7.7327, <6> 39.6471, <7> 5.2699, <8> 37.7549, <9> 49.9548, <10> 4.4534, <11> 16.7316, <12> 5.6871, <13> 4.2085, <14> 1.8458, <15> 39.1174, <16> 27.4506, <17> 43.6116, <18> 5.6116, <19> 26.1381, <20> 9.1347;
param workload[JOB] := <1> 12.7752, <2> 10.4652, <3> 37.2644, <4> 31.739, <5> 31.1591, <6> 12.9871, <7> 38.1804, <8> 31.9947, <9> 44.2812, <10> 43.7841, <11> 1.6925, <12> 15.0912, <13> 18.4996, <14> 6.8169, <15> 44.1899, <16> 33.1169, <17> 18.7809, <18> 49.6938, <19> 14.1213, <20> 12.63;
param capacity[MACHINE] := <1> 72.7519, <2> 72.7519, <3> 72.7519, <4> 72.7519, <5> 72.7519, <6> 72.7519, <7> 72.7519;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
