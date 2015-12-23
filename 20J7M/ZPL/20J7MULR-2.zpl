set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.9043, <2> 46.3263, <3> 22.4086, <4> 47.0277, <5> 1.8627, <6> 9.7614, <7> 35.486, <8> 7.2908, <9> 42.2036, <10> 34.609, <11> 18.2563, <12> 14.1998, <13> 31.6684, <14> 31.8426, <15> 26.2693, <16> 37.5552, <17> 28.7138, <18> 13.1144, <19> 8.5552, <20> 24.3142;
param workload[JOB] := <1> 38.1392, <2> 46.9528, <3> 8.9466, <4> 37.6427, <5> 40.0554, <6> 26.4013, <7> 45.0699, <8> 2.9368, <9> 21.0397, <10> 7.667, <11> 46.6713, <12> 30.4859, <13> 35.434, <14> 39.5832, <15> 20.8927, <16> 34.1891, <17> 26.9669, <18> 0.9589, <19> 26.8054, <20> 33.56;
param capacity[MACHINE] := <1> 81.4855, <2> 81.4855, <3> 81.4855, <4> 81.4855, <5> 81.4855, <6> 81.4855, <7> 81.4855;

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
