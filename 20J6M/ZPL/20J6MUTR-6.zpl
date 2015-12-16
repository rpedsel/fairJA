set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.7477, <2> 32.7282, <3> 38.9641, <4> 21.1539, <5> 10.771, <6> 17.1646, <7> 10.6081, <8> 2.7139, <9> 44.2826, <10> 9.1311, <11> 28.2097, <12> 29.0834, <13> 4.1302, <14> 16.9028, <15> 31.1166, <16> 13.691, <17> 7.6776, <18> 4.3598, <19> 14.8949, <20> 47.399;
param workload[JOB] := <1> 45.2037, <2> 47.2995, <3> 24.3187, <4> 19.4793, <5> 40.2704, <6> 14.2461, <7> 5.0956, <8> 20.7452, <9> 44.5658, <10> 30.6789, <11> 38.8112, <12> 45.3415, <13> 15.851, <14> 11.3085, <15> 25.0492, <16> 31.5003, <17> 8.3697, <18> 29.2513, <19> 47.8943, <20> 43.9803;
param capacity[MACHINE] := <1> 73.6576, <2> 73.6576, <3> 73.6576, <4> 73.6576, <5> 73.6576, <6> 73.6576;

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
