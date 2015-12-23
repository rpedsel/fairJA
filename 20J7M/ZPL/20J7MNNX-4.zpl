set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4764, <2> 18.6721, <3> 21.8371, <4> 27.8551, <5> 26.2159, <6> 18.5262, <7> 22.1325, <8> 26.975, <9> 27.1147, <10> 33.404, <11> 31.7944, <12> 28.7664, <13> 31.4837, <14> 28.3526, <15> 22.6591, <16> 22.55, <17> 15.1935, <18> 16.7085, <19> 25.4684, <20> 24.9177;
param workload[JOB] := <1> 5.4292, <2> 4.3211, <3> 4.673, <4> 5.2778, <5> 5.1201, <6> 4.3042, <7> 4.7045, <8> 5.1937, <9> 5.2072, <10> 5.7796, <11> 5.6387, <12> 5.3634, <13> 5.611, <14> 5.3247, <15> 4.7602, <16> 4.7487, <17> 3.8979, <18> 4.0876, <19> 5.0466, <20> 4.9918;
param capacity[MACHINE] := <1> 99.481, <2> 99.481, <3> 99.481, <4> 99.481, <5> 99.481, <6> 99.481, <7> 99.481;

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
