set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.4111, <2> 25.7253, <3> 18.1418, <4> 21.3299, <5> 19.8414, <6> 19.7405, <7> 17.4518, <8> 21.9288, <9> 29.2835, <10> 30.8244, <11> 26.5067, <12> 25.4078, <13> 21.7522, <14> 20.471, <15> 24.5729, <16> 27.9105, <17> 25.4203, <18> 29.7668, <19> 23.0673, <20> 31.46;
param workload[JOB] := <1> 17.7085, <2> 48.0186, <3> 35.7723, <4> 18.2017, <5> 40.5971, <6> 43.3134, <7> 14.065, <8> 10.9422, <9> 30.7564, <10> 31.2329, <11> 38.2617, <12> 30.6948, <13> 30.3987, <14> 7.3221, <15> 44.6275, <16> 8.326, <17> 18.7907, <18> 4.46, <19> 37.8611, <20> 23.6298;
param capacity[MACHINE] := <1> 66.8725, <2> 66.8725, <3> 66.8725, <4> 66.8725, <5> 66.8725, <6> 66.8725;

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
