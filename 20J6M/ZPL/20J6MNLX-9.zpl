set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1328, <2> 33.6494, <3> 29.9668, <4> 22.9314, <5> 33.3733, <6> 23.0107, <7> 35.6737, <8> 25.6933, <9> 32.0949, <10> 24.5878, <11> 31.9146, <12> 25.2594, <13> 28.7964, <14> 24.4069, <15> 27.6315, <16> 30.2684, <17> 21.485, <18> 24.4206, <19> 30.5711, <20> 19.2448;
param workload[JOB] := <1> 5.112, <2> 5.8008, <3> 5.4742, <4> 4.7887, <5> 5.777, <6> 4.7969, <7> 5.9727, <8> 5.0689, <9> 5.6652, <10> 4.9586, <11> 5.6493, <12> 5.0259, <13> 5.3662, <14> 4.9403, <15> 5.2566, <16> 5.5017, <17> 4.6352, <18> 4.9417, <19> 5.5291, <20> 4.3869;
param capacity[MACHINE] := <1> 17.4413, <2> 17.4413, <3> 17.4413, <4> 17.4413, <5> 17.4413, <6> 17.4413;

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
