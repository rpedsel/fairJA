set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.1076, <2> 17.7652, <3> 31.9062, <4> 31.9688, <5> 28.2446, <6> 44.4448, <7> 27.7933, <8> 11.1569, <9> 15.8871, <10> 8.277, <11> 44.7727, <12> 43.2469, <13> 46.0458, <14> 41.7137, <15> 32.4824, <16> 47.776, <17> 42.862, <18> 10.1957, <19> 18.872, <20> 23.3179;
param workload[JOB] := <1> 3.0179, <2> 4.2149, <3> 5.6486, <4> 5.6541, <5> 5.3146, <6> 6.6667, <7> 5.2719, <8> 3.3402, <9> 3.9859, <10> 2.877, <11> 6.6912, <12> 6.5762, <13> 6.7857, <14> 6.4586, <15> 5.6993, <16> 6.912, <17> 6.5469, <18> 3.1931, <19> 4.3442, <20> 4.8289;
param capacity[MACHINE] := <1> 17.338, <2> 17.338, <3> 17.338, <4> 17.338, <5> 17.338, <6> 17.338;

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
