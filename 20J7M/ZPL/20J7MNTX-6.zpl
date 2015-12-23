set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3524, <2> 28.0317, <3> 34.3448, <4> 20.004, <5> 32.2122, <6> 20.4313, <7> 22.4061, <8> 29.8719, <9> 18.7575, <10> 15.5583, <11> 23.3587, <12> 19.3307, <13> 26.9681, <14> 17.6924, <15> 16.1646, <16> 21.9026, <17> 25.1733, <18> 18.5766, <19> 25.1451, <20> 16.699;
param workload[JOB] := <1> 4.9348, <2> 5.2945, <3> 5.8604, <4> 4.4726, <5> 5.6756, <6> 4.5201, <7> 4.7335, <8> 5.4655, <9> 4.331, <10> 3.9444, <11> 4.8331, <12> 4.3967, <13> 5.1931, <14> 4.2062, <15> 4.0205, <16> 4.68, <17> 5.0173, <18> 4.3101, <19> 5.0145, <20> 4.0864;
param capacity[MACHINE] := <1> 10.1775, <2> 10.1775, <3> 10.1775, <4> 10.1775, <5> 10.1775, <6> 10.1775, <7> 10.1775;

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
