set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.8305, <2> 9.7071, <3> 31.2317, <4> 47.5281, <5> 21.7438, <6> 48.8035, <7> 14.2055, <8> 9.3635, <9> 47.3014, <10> 0.1192, <11> 37.0371, <12> 4.4226, <13> 30.5936, <14> 10.8478, <15> 36.5833, <16> 9.647, <17> 29.4651, <18> 5.3257, <19> 3.2871, <20> 0.7313;
param workload[JOB] := <1> 0.3643, <2> 38.8081, <3> 20.7224, <4> 0.9654, <5> 30.7707, <6> 47.6133, <7> 21.5841, <8> 35.5665, <9> 28.4141, <10> 13.9555, <11> 19.8193, <12> 8.5202, <13> 44.3583, <14> 22.4872, <15> 28.9739, <16> 13.9331, <17> 34.4388, <18> 2.7955, <19> 1.29, <20> 41.5693;
param capacity[MACHINE] := <1> 76.1583, <2> 76.1583, <3> 76.1583, <4> 76.1583, <5> 76.1583, <6> 76.1583;

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
